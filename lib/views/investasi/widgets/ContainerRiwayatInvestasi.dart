import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

class ContainerRiwayatInvestasi extends StatefulWidget{
  @override
  State<ContainerRiwayatInvestasi> createState() => _ContainerRiwayatInvestasiState();
}

class _ContainerRiwayatInvestasiState extends State<ContainerRiwayatInvestasi> {
  late Investasi datas;
  late List<Investasi> listDatas;

  List<Investasi> temp = [];
  List<String> selectedJenisInvestasi = [];

  @override
  void initState() {
    super.initState();
    datas = new Investasi("", "", "", "", "", "", "", "", 0,
        "", DateTime.now(), DateTime.now(), "", 0, 0, 0);

    this.listDatas = datas.getDataInvestasi();
    temp = this.listDatas;
  }

  @override
  Widget build(BuildContext context) {
    final item = listDatas;

    return temp.length > 0 ? Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100.0,
            child: TextButton(
              onPressed: () async {
                print("filter");
                await FilterListDialog.display<String>(
                    context,
                    listData: this.datas.dataDropDownJenisInvestasi(),
                    selectedListData: selectedJenisInvestasi,
                    height: 300,
                    headlineText: "Filter by Jenis Investasi",
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
                      if (list!.isNotEmpty) {
                        setState(() {
                          selectedJenisInvestasi = List.from(list);
                          this.listDatas = this.temp.where((element) => selectedJenisInvestasi.contains(element.jenisInvestasi)).toList();
                        });
                      } else {
                        setState(() {
                          selectedJenisInvestasi.clear();
                          this.listDatas = this.temp;
                        });
                      }

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
                          child: CustomText("Jenis Investasi", 15.0, true)
                      ),
                      SizedBox(height: 5.0,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("${item[index].jenisInvestasi}", 15.0, false),
                      ),
                      SizedBox(height: 15.0,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("Jangka Waktu Investasi", 15.0, true),
                      ),
                      SizedBox(height: 5.0,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomText("${item[index].jangkaWaktu}", 15.0, false),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    ) : CustomText("Belum ada riwayat Investasi", 15.0, true);
  }
}