import 'package:flutter/material.dart';

class FailedInformation extends SnackBar{
  FailedInformation(BuildContext context, String information):super(
    content: Text(
      information,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.white,
        fontFamily: 'Comfortaa',
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
    elevation: 10.0,
    behavior: SnackBarBehavior.floating,
  );
}