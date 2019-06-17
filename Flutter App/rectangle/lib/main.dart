import 'package:flutter/material.dart';

void main() { 
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("مصلحه الضرائب المصريه"),
        backgroundColor: Colors.yellow,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
        Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Text("مرحبا بك في مصلحه الضرائب المصرييه"),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Text("مرحبا بك في مصلحه الضرائب المصرييه"),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.yellow
        ),
        child: Text("مرحبا بك في مصلحه الضرائب المصرييه"),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.green
        ),
        child: Text("مرحبا بك في مصلحه الضرائب المصرييه"),
      ),
        ]
     ),
    ),
  ));
}
