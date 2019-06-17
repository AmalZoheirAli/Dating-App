import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal/styles.dart';

import 'Models/location.dart';
import 'location_detial.dart';

class LocationList extends StatelessWidget{
  
  final List<Location> locations;

  const LocationList({this.locations});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true ,
        title: Text(
        'الاخبار',
        style: Styles.headerLarge
        ),
        backgroundColor: Styles.defualtColor,
      ),
      backgroundColor: Styles.defualtColor,
      body:ListView.builder(
        itemCount: this.locations.length,
        itemBuilder: _listViewItemBuilder,
      )
    ); 
  }
  void _navigationToLocationDetials(BuildContext context,Location location){
     Navigator.push(context,MaterialPageRoute(
                builder: (context)=>LocalDetials(location:location),
      )
     );
  }
  Widget _listViewItemBuilder(BuildContext context,int index){
    var location=this.locations[index];
     return ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: _itemThumbnail(location),
            title: _itemTitle(location.facts[0].title),
            subtitle:  _itemTitle(location.facts[0].text),
            onTap: (){
               _navigationToLocationDetials(context,location);
            },
          ); 
  }
  Widget _itemThumbnail(Location location) {
    var assetsImage = new AssetImage(location.url);
    var image = new Image(image: assetsImage,fit: BoxFit.fitWidth);
    return Container(
      constraints:BoxConstraints.tightFor(width: 100),
      child:image,
    );
  }

  Widget _itemTitle(String text) {
      return Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0,5.0, 5.0),
        child: Text(text,
         textAlign: TextAlign.right,
         style:Styles.defualtText
        )
      );
  }
}