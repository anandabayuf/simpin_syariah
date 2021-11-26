import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/investasi/widgets/FormInvestasi1.dart';

class AjukanInvestasiScreen1 extends StatelessWidget{
  final Investasi investasi;

  AjukanInvestasiScreen1({Key? key, required this.investasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: ButtonBack(),
        title: CustomText('Form Investasi', 24.0, false),
        centerTitle: true,
        elevation: 0,
        backgroundColor: HexColor("#50AEA7"),
      ),
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
              child: FormInvestasi1(investasi: investasi,),
            ),
          ),
        ),
      ),
    );
  }
}