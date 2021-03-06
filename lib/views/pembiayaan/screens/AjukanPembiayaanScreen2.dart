import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/pembiayaan/widgets/FormPembiayaan2.dart';

class AjukanPembiayaanScreen2 extends StatelessWidget{
  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;

  AjukanPembiayaanScreen2({Key? key, required this.pembiayaan, required this.formKeyScreen1}) : super(key: key);

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
                    child: CustomText('Form Pembiayaan', 24.0, false),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 30.0,),
                  FormPembiayaan2(pembiayaan: pembiayaan, formKeyScreen1: this.formKeyScreen1,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}