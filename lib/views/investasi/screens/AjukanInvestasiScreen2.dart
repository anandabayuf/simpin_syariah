import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/investasi/widgets/FormInvestasi2.dart';

class AjukanInvestasiScreen2 extends StatelessWidget{
  final Investasi investasi;
  final GlobalKey<FormState> formKeyScreen1;

  AjukanInvestasiScreen2({Key? key, required this.investasi, required this.formKeyScreen1}) : super(key: key);

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
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    child: CustomText('Form Investasi', 24.0, false),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 30.0,),
                  FormInvestasi2(investasi: investasi, formKeyScreen1: this.formKeyScreen1,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}