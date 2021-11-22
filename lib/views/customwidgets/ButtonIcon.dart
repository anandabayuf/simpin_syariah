import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

class ButtonIcon extends StatelessWidget{
  final String name;
  final String assetLoc;
  final String route;

  ButtonIcon(this.name, this.assetLoc, this.route);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, this.route);
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Card(
              elevation: 10.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: CircleAvatar(
                backgroundColor: HexColor("#F8B50F"),
                child: SvgPicture.asset(
                  assetLoc,
                  height: 30.0,
                  width: 30.0,
                  fit: BoxFit.fitHeight,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          CustomText(this.name, 12.0, true)
        ],
      )
    );
  }
}