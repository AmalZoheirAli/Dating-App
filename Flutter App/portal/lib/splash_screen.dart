import 'dart:async';

import 'package:flutter/material.dart';

import 'Models/location.dart';
import 'location_list.dart';
import 'mocks/mock_loaction.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState()=> new _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{
  final List<Location> mockLocationList=MockLocation.fetchAll();
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1),()=>
     _navigationToLocationDetials(context,mockLocationList)
    );
  }
  @override
  Widget build(BuildContext context){
   return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Group 182.png'),
            fit: BoxFit.cover
        ) ,
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