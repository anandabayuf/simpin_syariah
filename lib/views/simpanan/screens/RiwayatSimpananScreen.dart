import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/simpanan/RiwayatSimpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/simpanan/widgets/ContainerRiwayatSimpanan.dart';

class RiwayatSimpananScreen extends StatelessWidget{
  late RiwayatSimpanan riwayatSimpanan;
  late List<RiwayatSimpanan> listDataRiwayatSimpanan;

  RiwayatSimpananScreen(){
    riwayatSimpanan = new RiwayatSimpanan("", "", 0);
    this.listDataRiwayatSimpanan = riwayatSimpanan.getRiwayatSimpanan();
    // this.listDataRiwayatSimpanan = [];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
        appBar: AppBar(
          leading: ButtonBack(),
          title: CustomText('Riwayat Simpanan', 24.0, false),
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
          child: this.listDataRiwayatSimpanan.isNotEmpty ? SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0,),
              child: ContainerRiwayatSimpanan(this.riwayatSimpanan, this.listDataRiwayatSimpanan)
            ),
          ) : Center(
            child: CustomText("Belum ada riwayat simpanan", 15.0, true),
          ),
        ),
      ),
    );
  }
}