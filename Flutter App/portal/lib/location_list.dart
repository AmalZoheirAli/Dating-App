import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal/styles.dart';

import 'Models/location.dart';

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
      body:null
    ); 
  }
}