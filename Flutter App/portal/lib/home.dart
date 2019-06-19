import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portal/Models/location.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState()=> new _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1),()=>
     getData()
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
  Future<String> getData() async{
    http.Response response=await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers:{
        "Accept":"application/json"
      }
    );
    List data=jsonDecode(response.body);
    print(data[1]['title']);
  }
} 