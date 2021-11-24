import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/models/user/User.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/investasi/screens/AjukanInvestasiScreen1.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/AjukanPembiayaanScreen1.dart';

class InformasiPengajuanInvestasiScreen extends StatelessWidget{
  final Investasi investasi;

  InformasiPengajuanInvestasiScreen(this.investasi);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText('Informasi Investasi', 24.0, false),
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
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0,),
              child: Column(
                children: [
                  CustomText(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. "
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd guber",
                    12.0,
                    false
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 39,
                          child: ElevatedButton(
                            onPressed: (){
                              // this.saveAllDataPembiayaan();
                              //
                              // print(
                              //     "tanggal akad : ${this.pembiayaan.tanggalAkad}\n"
                              //         "nilai PPA : ${this.pembiayaan.nilaiPPA}\n"
                              //         "harga jual : ${this.pembiayaan.hargaJual}\n"
                              //         "angsuran : ${this.pembiayaan.angsuran}\n"
                              //         "thp gaji terakhir : ${this.pembiayaan.tHPGajiTerakhir}\n"
                              //         "cash ratio : ${this.pembiayaan.cashRatio}\n"
                              // );
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => AjukanInvestasiScreen1(investasi: investasi))
                              );

                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                primary: HexColor("#F8B50F"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: EdgeInsets.all(5.0)
                            ),
                            child: Text(
                              "MENGERTI",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        child: Container(
                          height: 39,
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              primary: Colors.white.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: EdgeInsets.all(5.0),
                            ),
                            child: Text(
                              "KEMBALI",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}