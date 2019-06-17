import 'package:flutter/material.dart';
import 'package:portal/Models/location.dart';


import 'location_detial.dart';
import 'location_list.dart';
import 'mocks/mock_loaction.dart';

void main() { 
 // final Location mockLocation=MockLocation.fetchAny();
  return runApp(MaterialApp( 
   // home: LocalDetials(location:mockLocation),
    home: LocationList(locations:[])
  ));
}