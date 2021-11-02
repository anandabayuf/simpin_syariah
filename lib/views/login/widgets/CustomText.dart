import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  late String text;
  late double fontSize;
  late bool opacity;

  CustomText(String text, double fontSize, bool opacity){
    this.text = text;
    this.fontSize = fontSize;
    this.opacity = opacity;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: this.fontSize,
        color: this.opacity ? Colors.white.withOpacity(0.5) : Colors.white,
        fontFamily: 'Comfortaa'
      ),
    );
  }
}