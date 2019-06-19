import 'package:flutter/material.dart';
import 'package:portal/Models/location.dart';
import 'package:portal/splash_screen.dart';


import 'home.dart';
import 'location_detial.dart';
import 'location_list.dart';
import 'login_home.dart';
import 'mocks/mock_loaction.dart';

void main() { 
 // final Location mockLocation=MockLocation.fetchAny();
 //final List<Location> mockLocationList=MockLocation.fetchAll();
  return runApp(MaterialApp( 
   // home: LocalDetials(location:mockLocation),
  //home: LocationList(locations:mockLocationList)
  home:HomeScreen(),
  ));
}