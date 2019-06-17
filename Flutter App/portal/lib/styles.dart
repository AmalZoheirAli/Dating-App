import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Styles{
  static const _textSizeLarge=16.0;
  static const _textSizeDefualt=12.0;
  static final Color defualtColor=Colors.white;
  static final Color _textColorStrong=_hexToColor('515C6F');
  static final Color _textColorDefualt=_hexToColor('888888');
  static final String _fontNameTitle='CairoBold';
  static final String _fontNameDefualt='CairoRegular';
    
    static final headerLarge=TextStyle(
      fontFamily: _fontNameTitle,
      fontSize:_textSizeLarge,
      color: _textColorStrong
    );
    
    static final defualtText=TextStyle(
      fontFamily: _fontNameDefualt,
      fontSize:_textSizeDefualt,
      color: _textColorDefualt
    );
    static Color _hexToColor(String code) {
      return Color(
        int.parse(code.substring(0,6),radix:16)+0xff000000
      );
    }
}