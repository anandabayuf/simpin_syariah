import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/models/investasi/PengembalianNisbah.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ContainerPengembalianNisbah extends StatefulWidget{
  final Investasi riwayatInvestasi;

  ContainerPengembalianNisbah({Key? key, required this.riwayatInvestasi}) : super(key: key);

  @override
  _ContainerDetailSimpananState createState() => _ContainerDetailSimpananState(this.riwayatInvestasi);
}

class _ContainerDetailSimpananState extends State<ContainerPengembalianNisbah> {
  late PengembalianNisbah pengembalianNisbah;
  late List<PengembalianNisbah> listDataPengembalianNisbah;
  late DateFormat dateFormat;
  final Investasi riwayatInvestasi;

  _ContainerDetailSimpananState(this.riwayatInvestasi);

  @override
  void initState() {
    super.initState();
    pengembalianNisbah = new PengembalianNisbah(0, new Investasi("", "",
        "", "", "", "", "", "", "", 0, "", DateTime.now(), DateTime.now(),
        "", 0, 0, 0, new XFile(""), new XFile(""), new XFile(""), new XFile(""),
        new XFile(""), new XFile("")), DateTime.now(), "");
    this.listDataPengembalianNisbah = pengembalianNisbah.getDataPengembalianNisbah(riwayatInvestasi.id);
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('id');
  }

  @override
  Widget build(BuildContext context) {
    final item = listDataPengembalianNisbah;
    final formatCurrency = new NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);

    return ListView.builder(
      itemCount: listDataPengembalianNisbah.length,
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
                        child: CustomText("${this.riwayatInvestasi.id}", 15.0, true)
                    ),
                    SizedBox(height: 15.0,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Nisbah Investor", 15.0, true)
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText("${formatCurrency.format(item[index].investasi.nisbahInvestor)}", 15.0, false),
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
                      child: CustomText("Status Nisbah", 15.0, true),
                    ),
                    SizedBox(height: 5.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30.0,
                        width: item[index].statusNisbah == "Terbayar" ? 100 : 140 ,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          color: item[index].statusNisbah == "Terbayar" ? HexColor("#00C851") : Colors.orange,
                          child: Align(
                            child: CustomText("${item[index].statusNisbah}", 15.0, false),
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

