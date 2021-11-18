import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/ProfileButton.dart';
import 'package:project_simpin_syariah/views/investasi/widgets/FormInvestasi3.dart';

class AjukanInvestasiScreen3 extends StatelessWidget{
  final Investasi investasi;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;

  AjukanInvestasiScreen3({Key? key, required this.investasi, required this.formKeyScreen1,
    required this.formKeyScreen2}) : super(key: key);

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
                    child: ProfileButton(),
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 10.0,),
                  Align(
                    child: CustomText('Form Investasi', 24.0, false),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 20.0,),
                  FormInvestasi3(investasi: this.investasi, formKeyScreen1: this.formKeyScreen1, formKeyScreen2: this.formKeyScreen2,),
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