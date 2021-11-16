import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';

class ContainerRiwayatPembiayaan extends StatefulWidget{
  @override
  _ContainerRiwayatPembiayaanState createState() => _ContainerRiwayatPembiayaanState();
}

class _ContainerRiwayatPembiayaanState extends State<ContainerRiwayatPembiayaan> {
  late RiwayatPembiayaan datas;
  late List<RiwayatPembiayaan> listDatas;

  @override
  void initState() {
    super.initState();
    datas = RiwayatPembiayaan(0, 0, "", "", "");
    this.listDatas = datas.getDataRiwayatPembiayaan();
  }

  @override
  Widget build(BuildContext context) {
    final item = listDatas;
    final formatCurrency = new NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);

    return ListView.builder(
      itemCount: listDatas.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index){
        return Container(
          child: InkWell(
            onTap: (){
              print("card ${index}");
            },
            child: Card(
              color: Colors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Nilai Pembiayaan", 15.0, true)
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${formatCurrency.format(item[index].nilaiPembiayaan)}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Tujuan Pembiayaan", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${item[index].tujuanPembiayaan}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Jenis Akad", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${item[index].jenisAkad}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Status Pembiayaan", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30.0,
                        width: item[index].statusPembiayaan == "Lunas" ? 75 : 130,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: item[index].statusPembiayaan == "Lunas" ? HexColor("#00C851") : HexColor("#FFBB33"),
                          child: Align(
                            child: CustomText("${item[index].statusPembiayaan}", 15.0, false),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 150,
                        child: InkWell(
                          onTap: (){
                            print("lihat Detail ${index}");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Lihat Detail',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontFamily: 'Comfortaa'
                                ),
                              ),
                              SizedBox(width: 5.0,),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 32.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}