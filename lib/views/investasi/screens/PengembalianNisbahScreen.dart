import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonBack.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/investasi/widgets/ContainerPengembalianNisbah.dart';

class PengembalianNisbahScreen extends StatelessWidget{
  final Investasi riwayatInvestasi;

  PengembalianNisbahScreen({Key? key, required this.riwayatInvestasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: ButtonBack(),
        title: CustomText('Pengembalian Nisbah', 24.0, false),
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
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0,
                    top: 10.0),
                child: ContainerPengembalianNisbah(riwayatInvestasi: this.riwayatInvestasi,)
            ),
          ),
        ),
      ),
    );
  }
}