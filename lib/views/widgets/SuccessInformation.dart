import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SuccessInformation extends SnackBar{
  SuccessInformation(BuildContext context, String information):super(
    content: Text(
      information,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.white,
        fontFamily: 'Comfortaa',
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: HexColor("#00C851"),
    elevation: 10.0,
    behavior: SnackBarBehavior.floating,
  );
}