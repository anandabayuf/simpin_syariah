import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("back");
      },
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      icon: Icon(
        Icons.arrow_back_rounded,
        size: 32.0,
        color: Colors.white,
      )
    );
  }
}