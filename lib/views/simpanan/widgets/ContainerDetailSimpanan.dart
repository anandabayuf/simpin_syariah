import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/simpanan/DetailSimpanan.dart';
import 'package:project_simpin_syariah/models/simpanan/RiwayatSimpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ContainerDetailSimpanan extends StatefulWidget{
  final RiwayatSimpanan riwayatSimpanan;

  ContainerDetailSimpanan({Key? key, required this.riwayatSimpanan}) : super(key: key);

  @override
  _ContainerDetailSimpananState createState() => _ContainerDetailSimpananState(this.riwayatSimpanan);
}

class _ContainerDetailSimpananState extends State<ContainerDetailSimpanan> {
  late DetailSimpanan detailSimpanan;
  late List<DetailSimpanan> listDataDetailSimpanan;
  late DateFormat dateFormat;
  final RiwayatSimpanan riwayatSimpanan;

  _ContainerDetailSimpananState(this.riwayatSimpanan);

  @override
  void initState() {
    super.initState();
    detailSimpanan = new DetailSimpanan("", new RiwayatSimpanan("", "", 0), 0, DateTime.now(), "") ;
    this.listDataDetailSimpanan = detailSimpanan.getDetailSimpanan(riwayatSimpanan.id);
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('id');
  }

  @override
  Widget build(BuildContext context) {
    final item = listDataDetailSimpanan;
    final formatCurrency = new NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);

    return ListView.builder(
      itemCount: listDataDetailSimpanan.length,
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
                        child: CustomText("${this.riwayatSimpanan.id}", 15.0, true)
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Nominal Simpanan", 15.0, true)
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${formatCurrency.format(item[index].nominalSimpanan)}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Tanggal Simpanan", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${dateFormat.format(item[index].tanggalSimpanan)}", 15.0, false),
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("Status Simpanan", 15.0, true),
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

