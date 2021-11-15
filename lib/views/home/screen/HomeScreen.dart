import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/home/widgets/ContainerTitle.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/ProfileButton.dart';

class HomeScreen extends StatelessWidget{
  final String username = "Andini";

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
                    child: ProfileButton(),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 30.0,),
                  ContainerTitle(),
                  SizedBox(height: 30.0,),
                  Align(
                    child: CustomText('Halo, ${this.username}', 20.0, true),
                    alignment: Alignment.centerLeft,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}