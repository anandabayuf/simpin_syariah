import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/AjukanPembiayaanScreen1.dart';
import 'package:project_simpin_syariah/views/pembiayaan/widgets/ContainerRiwayatPembiayaan.dart';

class RiwayatPembiayaanScreen extends StatelessWidget{
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
                    child: CustomText('Riwayat Pembiayaan', 24.0, false),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 10.0,),
                  ContainerRiwayatPembiayaan()
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 240,
        child: FloatingActionButton(
          onPressed: (){
            print("Ajukan Pembiayaan");
            final pembiayaan = new Pembiayaan("", "", "", "", "", "", "", DateTime.now(),
                0, 0, 0, 0, 0, new XFile(""), new XFile(""), new XFile(""), new XFile(""),
                new XFile(""), new XFile(""));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AjukanPembiayaanScreen1(pembiayaan: pembiayaan))
            );
          },
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29.0),
          ),
          backgroundColor: HexColor("#F8B50F"),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 32.0,
                  color: Colors.white,
                ),
                SizedBox(width: 5.0,),
                CustomText("Ajukan Pembiayaan", 15.0, false),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}