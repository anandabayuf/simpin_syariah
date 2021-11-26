import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/DetailAngsuran.dart';
import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ContainerDetailRiwayatPembiayaan extends StatefulWidget{
  final String idRiwayatPembiayaan;

  ContainerDetailRiwayatPembiayaan({Key? key, required this.idRiwayatPembiayaan}) : super(key: key);

  @override
  _ContainerDetailRiwayatPembiayaanState createState() => _ContainerDetailRiwayatPembiayaanState(this.idRiwayatPembiayaan);
}

class _ContainerDetailRiwayatPembiayaanState extends State<ContainerDetailRiwayatPembiayaan> {
  late DetailAngsuran datas;
  late List<DetailAngsuran> listDatas;
  late DateFormat dateFormat;
  final String idRiwayatPembiayaan;

  _ContainerDetailRiwayatPembiayaanState(this.idRiwayatPembiayaan);

  @override
  void initState() {
    super.initState();
    datas = DetailAngsuran(0, new RiwayatPembiayaan("", 0, "", "", ""), DateTime.now(), 0, 0, "");
    this.listDatas = datas.getDataDetailRiwayatPembiayaan(this.idRiwayatPembiayaan);
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('id');
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
              print("card $index");
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
                        child: CustomText("${item[index].riwayatPembiayaan.id}", 15.0, true)
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Nilai Pembiayaan", 15.0, true)
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${formatCurrency.format(item[index].riwayatPembiayaan.nilaiPembiayaan)}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Tujuan Pembiayaan", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${item[index].riwayatPembiayaan.tujuanPembiayaan}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Jenis Akad", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${item[index].riwayatPembiayaan.jenisAkad}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Tanggal Jatuh Tempo", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${dateFormat.format(item[index].tanggalJatuhTempo)}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Bayar Cicilan", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${formatCurrency.format(item[index].bayarCicilan)}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Sisa Cicilan", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${item[index].sisaCicilan}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Status", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30.0,
                        width: item[index].status == "Terbayar" ? 100 : 140 ,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: item[index].status == "Terbayar" ? HexColor("#00C851") : Colors.orange,
                          child: Align(
                            child: CustomText("${item[index].status}", 15.0, false),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ),
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

