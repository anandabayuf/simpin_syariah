import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/InformasiPengajuanPembiayaanScreen.dart';
import 'package:project_simpin_syariah/views/pembiayaan/widgets/ContainerRiwayatPembiayaan.dart';

class RiwayatPembiayaanScreen extends StatelessWidget{
  late RiwayatPembiayaan riwayatPembiayaan;
  late List<RiwayatPembiayaan> listDataRiwayatPembiayaan;

  RiwayatPembiayaanScreen(){
    riwayatPembiayaan = RiwayatPembiayaan("", 0, "", "", "");
    listDataRiwayatPembiayaan = riwayatPembiayaan.getDataRiwayatPembiayaan();
    // listDataRiwayatPembiayaan = [];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: ButtonBack(),
        title: CustomText('Riwayat Pembiayaan', 24.0, false),
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
          child: this.listDataRiwayatPembiayaan.isNotEmpty ? SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0,),
              child: ContainerRiwayatPembiayaan(listDataRiwayatPembiayaan)
            ),
          ) : Center (
            child: CustomText("Belum ada riwayat pembiayaan", 15.0, true)
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: screenSize.width - 40,
        child: FloatingActionButton(
          onPressed: (){
            print("Ajukan Pembiayaan");
            final pembiayaan = new Pembiayaan("", "", "", "", "", "", "", DateTime.now(),
                0, 0, 0, 0, 0, new XFile(""), new XFile(""), new XFile(""), new XFile(""),
                new XFile(""), new XFile(""));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InformasiPengajuanPembiayaanScreen(pembiayaan))
            );
          },
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: HexColor("#F8B50F"),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomText("AJUKAN PEMBIAYAAN", 20.0, false),
          ),
        ),
      ),
    );
  }
}