import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/simpanan/Simpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/ProfileButton.dart';
import 'package:project_simpin_syariah/views/simpanan/widgets/FormSimpanan.dart';

class TambahSimpananScreen extends StatelessWidget{
  final Simpanan simpanan;

  TambahSimpananScreen({Key? key, required this.simpanan}) : super(key: key);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonBack(),
                      Align(
                        child: ProfileButton(),
                        alignment: Alignment.centerRight,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Align(
                    child: CustomText('Form Simpanan', 24.0, false),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 20.0,),
                  FormSimpanan(simpanan: simpanan),
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