import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/investasi/screens/AjukanInvestasiScreen1.dart';
import 'package:project_simpin_syariah/views/investasi/screens/InformasiPengajuanInvestasiScreen.dart';
import 'package:project_simpin_syariah/views/investasi/widgets/ContainerRiwayatInvestasi.dart';

class RiwayatInvestasiScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: ButtonBack(),
        title: CustomText('Riwayat Investasi', 24.0, false),
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
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0,),
              child: ContainerRiwayatInvestasi()
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: screenSize.width-40,
        child: FloatingActionButton(
          onPressed: (){
            print("Ajukan Investasi");
            final investasi = new Investasi("", "", "", "", "", "", "", "", 0,
                "", DateTime.now(), DateTime.now().add(Duration(days: 1)), "", 0, 0, 0,
                new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""));
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformasiPengajuanInvestasiScreen(investasi))
            );
          },
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: HexColor("#F8B50F"),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomText("AJUKAN INVESTASI", 20.0, false),
          ),
        ),
      ),
    );
  }
}