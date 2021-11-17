import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';
import 'package:project_simpin_syariah/models/simpanan/RiwayatSimpanan.dart';
import 'package:project_simpin_syariah/models/simpanan/Simpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonText.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';

class ContainerRiwayatSimpanan extends StatefulWidget{
  @override
  _ContainerRiwayatSimpananState createState() => _ContainerRiwayatSimpananState();
}

class _ContainerRiwayatSimpananState extends State<ContainerRiwayatSimpanan> {
  late RiwayatSimpanan datas;
  late List<RiwayatSimpanan> listDatas;

  late Simpanan simpanan;

  List<RiwayatSimpanan> temp = [];
  List<String> selectedJenisSimpanan = [];

  @override
  void initState() {
    super.initState();
    datas = RiwayatSimpanan(0, new Simpanan("", 0));

    this.listDatas = datas.getRiwayatSimpanan();
    temp = this.listDatas;

    simpanan = Simpanan.emptyConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final item = listDatas;
    final formatCurrency = new NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);

    return temp.length > 0 ? Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100.0,
            child: TextButton(
              onPressed: () async {
                print("Tambah filter");
                await FilterListDialog.display<String>(
                  context,
                  listData: simpanan.getDataJenisSimpanan(),
                  selectedListData: selectedJenisSimpanan,
                  height: 300,
                  headlineText: "Filter by Jenis Simpanan",
                  choiceChipLabel: (item) {
                    return item;
                  },
                  hideSearchField: true,
                  backgroundColor: Colors.white.withOpacity(0.5),//HexColor("#F8B50F"),
                  closeIconColor: Colors.red,
                  allButtonText: "Pilih Semua",
                  applyButonTextBackgroundColor: HexColor("#F8B50F"),
                  applyButtonText: "Filter",
                  applyButtonTextStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: "Comfortaa",
                  ),
                  controlButtonTextStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: "Comfortaa",
                    decoration: TextDecoration.underline
                  ),
                  buttonSpacing: 10.0,
                  headerTextStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: "Comfortaa",
                  ),
                  hideSelectedTextCount: true,
                  selectedChipTextStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontFamily: "Comfortaa",
                  ),
                  selectedTextBackgroundColor: HexColor("#F8B50F"),
                  unselectedChipTextStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: "Comfortaa",
                  ),
                  controlContainerDecoration: BoxDecoration(
                    color: Colors.transparent
                  ),
                  wrapAlignment: WrapAlignment.center,
                  wrapCrossAxisAlignment: WrapCrossAlignment.center,
                  validateSelectedItem: (list, val) {
                    return list!.contains(val);
                  },
                  onItemSearch: (list, text) {
                    return [];
                  },
                  onApplyButtonClick: (list) {
                    //print(list);
                    if (list!.isNotEmpty) {
                      setState(() {
                        selectedJenisSimpanan = List.from(list);
                        this.listDatas = this.temp.where((element) => selectedJenisSimpanan.contains(element.simpanan.jenisSimpanan)).toList();
                      });
                    } else {
                      setState(() {
                        selectedJenisSimpanan.clear();
                        this.listDatas = this.temp;
                      });
                    }
                    //print(selectedJenisSimpanan);
                    Navigator.pop(context);
                  }
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.filter_list_rounded,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    "Filter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        ListView.builder(
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
                            child: CustomText("Jenis Simpanan", 15.0, true)
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("${item[index].simpanan.jenisSimpanan}", 15.0, false),
                        ),
                        SizedBox(height: 15.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("Nominal Simpanan", 15.0, true),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("${formatCurrency.format(item[index].simpanan.nominalSimpanan)}", 15.0, false),
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
        ),
      ],
    ) : CustomText("Belum ada riwayat Simpanan", 15.0, true);
  }
}