import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class MainWidget {
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
}