
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal/styles.dart';

import 'Models/location.dart';
import 'location_detial.dart';
import 'location_list.dart';
import 'mocks/mock_loaction.dart';

class LoginHome extends StatelessWidget{
  final List<Location> mockLocationList=MockLocation.fetchAll();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(200.0,100.0,0.0,0.0),
            child: Stack(
              children: <Widget>[
                _itemLogo('assets/images/Rectangle 39@2x.png',300),
                _itemLogo('assets/images/logo@2x.png',300)
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                _itemTextField('اسم المستخدم'),
                _itemTextField('كلمه المرور'),
                _itemButton('تسجيل دخول',context,mockLocationList),
                _itemButton('إنشاء حساب جديد',context,mockLocationList),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
  Widget _itemLogo(String url,double imageWidth) {
    var assetsImage = new AssetImage(url);
    var image = new Image(image: assetsImage,fit: BoxFit.fitWidth);
    return Container(
      constraints:BoxConstraints.tightFor(width: imageWidth),
      child:image,
    );
    
  }
Widget _itemTextField(String text) {
      return Container(
        child: TextField(
         decoration: InputDecoration(
           labelText: text,
           labelStyle:Styles.defualtText 
         ),
         textAlign:TextAlign.right, 
        )
      );
  }
Widget _itemButton(String text,BuildContext context,List<Location> locationsList) {
      return Container(
        padding: EdgeInsets.all(10.0),
        height: 60.0,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Styles.defualtColor,
          color: Styles.defualtColor,
          elevation: 7.0,
          child: GestureDetector(
            onTap: (){
              _navigationToLocationDetials(context,locationsList);
            },
            child: Center(
              child:_itemButtonText(text) ,
            ),
          ),
        ),
      );
  }
  Widget _itemButtonText(String text) {
      return Container(
        padding: EdgeInsets.fromLTRB(5.0, 5.0,5.0, 5.0),
        child: Text(text,
         textAlign: TextAlign.right,
         style:Styles.defualtText
        )
      );
  }
  void _navigationToLocationDetials(BuildContext context,List<Location> locationsList){
     Navigator.push(context,MaterialPageRoute(
                builder: (context)=>LocationList(locations:locationsList),
      )
     );
  }
}