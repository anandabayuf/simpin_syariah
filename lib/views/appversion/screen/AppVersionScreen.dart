import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/ProfileButton.dart';

class AppVersionScreen extends StatelessWidget{
  final double appVer = 2.1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      body: ColorfulSafeArea(
        color: HexColor("#50AEA7"),
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: HexColor("#50AEA7"),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    child: ButtonBack(),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    height: screenSize.height - 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          child: Image.asset(
                            'assets/images/login/LambangKoperasi.png',
                            height: 150.0,
                            width: 150.0,
                          ),
                          color: Colors.transparent,
                          elevation: 18.0,
                          shape: CircleBorder(),
                        ),
                        SizedBox(height: 30.0,),
                        CustomText('Simpin Syariah', 24.0, false),
                        SizedBox(height: 10.0,),
                        CustomText('Versi ${appVer}', 15.0, true),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}