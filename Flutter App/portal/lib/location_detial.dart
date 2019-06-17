import 'package:flutter/material.dart';
import 'package:portal/Models/location.dart';
import 'package:portal/styles.dart';
class LocalDetials extends StatelessWidget{
  final Location location;

  const LocalDetials({this.location});
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text(
        location.name,
        style: Styles.headerLarge
        ),
        backgroundColor: Styles.defualtColor,
      ),
      backgroundColor: Styles.defualtColor,
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children:_renderBody(context,location),
     ),
    ); 
  }
  Widget _section(String title,Color color,TextStyle textStyle){
    return Container(
        decoration: BoxDecoration(
          color: color
        ),
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        child: Text(title,
         textAlign: TextAlign.right,
         style:textStyle
        )
      );
  }
  Widget _bannerImage(String url,double height){
    var assetsImage = new AssetImage(url);
    var image = new Image(image: assetsImage,fit: BoxFit.fill);
    return Container(
      constraints:BoxConstraints.tightFor(height:height),
      child:image,
    );
  }
  List<Widget> _renderFact(BuildContext context,Location location){
    var result=List<Widget>();
    for(int i=0;i<location.facts.length;i++){
      result.add(_section(location.facts[i].title, Styles.defualtColor, Styles.headerLarge));
      result.add(_section(location.facts[i].text, Styles.defualtColor,Styles.defualtText));
    }
    return result;
  }
  List<Widget> _renderBody(BuildContext context,Location location){
    var result=List<Widget>();
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFact(context,location));
    return result;
  }
}

 
