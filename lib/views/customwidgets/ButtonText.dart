import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonText extends StatelessWidget{
  late String buttonName;
  late String destRoute;

  ButtonText(String buttonName, String destRoute){
    this.buttonName = buttonName;
    this.destRoute = destRoute;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(this.destRoute);
      },
      child: Text(
        this.buttonName,
        style: TextStyle(
          color: HexColor('#F8B50F'),
          fontSize: 15.0,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}