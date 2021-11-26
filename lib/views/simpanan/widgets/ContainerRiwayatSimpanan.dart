import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/simpanan/RiwayatSimpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:project_simpin_syariah/views/simpanan/screens/DetailSimpananScreen.dart';

class ContainerRiwayatSimpanan extends StatefulWidget{
  late RiwayatSimpanan riwayatSimpanan;
  late List<RiwayatSimpanan> listDataRiwayatSimpanan;

  ContainerRiwayatSimpanan(this.riwayatSimpanan, this.listDataRiwayatSimpanan);

  @override
  _ContainerRiwayatSimpananState createState() => _ContainerRiwayatSimpananState(
    this.riwayatSimpanan, this.listDataRiwayatSimpanan
  );
}

class _ContainerRiwayatSimpananState extends State<ContainerRiwayatSimpanan> {
  late RiwayatSimpanan riwayatSimpanan;
  late List<RiwayatSimpanan> listDataRiwayatSimpanan;

  List<RiwayatSimpanan> temp = [];
  List<String> selectedJenisSimpanan = [];

  late List<bool> stateJenisSimpanan;

  _ContainerRiwayatSimpananState(this.riwayatSimpanan, this.listDataRiwayatSimpanan);

  @override
  void initState() {
    super.initState();

    temp = this.listDataRiwayatSimpanan;

    stateJenisSimpanan = List.generate(this.riwayatSimpanan.getDataJenisSimpanan().length, (index) => false);
  }

  void initiateState(){
    if(selectedJenisSimpanan.isEmpty){
      stateJenisSimpanan = List.generate(this.riwayatSimpanan.getDataJenisSimpanan().length, (index) => false);
    } else {
      var i = 0;
      while(i < riwayatSimpanan.getDataJenisSimpanan().length){
        if(!selectedJenisSimpanan.contains(riwayatSimpanan.getDataJenisSimpanan().elementAt(i))){
          this.stateJenisSimpanan[i] = false;
        } else {
          this.stateJenisSimpanan[i] = true;
        }
        i++;
      }
    }
  }

  void setValueJenisSimpanan(index, stateSetter, value){
    stateSetter(() {
      stateJenisSimpanan[index] = value;
    });
  }

  void pilihSemuaJenisSimpanan(stateSetter){
    var i = 0;
    while(i < this.riwayatSimpanan.getDataJenisSimpanan().length){
      stateSetter((){
        this.stateJenisSimpanan[i] = true;
      });
      i++;
    }
  }

  void clearAllChosenJenisSimpanan(stateSetter){
    var i = 0;
    while(i < this.riwayatSimpanan.getDataJenisSimpanan().length){
      stateSetter((){
        this.stateJenisSimpanan[i] = false;
      });
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = listDataRiwayatSimpanan;
    final jenisSimpanan = riwayatSimpanan.getDataJenisSimpanan();
    final formatCurrency = new NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100.0,
            child: TextButton(
              onPressed: () {
                // await FilterListDialog.display<String>(
                //   context,
                //   listData: simpanan.getDataJenisSimpanan(),
                //   selectedListData: selectedJenisSimpanan,
                //   height: 300,
                //   headlineText: "Filter by Jenis Simpanan",
                //   choiceChipLabel: (item) {
                //     return item;
                //   },
                //   hideSearchField: true,
                //   backgroundColor: Colors.white.withOpacity(0.5),//HexColor("#F8B50F"),
                //   closeIconColor: Colors.red,
                //   allButtonText: "Pilih Semua",
                //   applyButonTextBackgroundColor: HexColor("#F8B50F"),
                //   applyButtonText: "Filter",
                //   applyButtonTextStyle: TextStyle(
                //     fontSize: 15.0,
                //     color: Colors.white,
                //     fontFamily: "Comfortaa",
                //   ),
                //   controlButtonTextStyle: TextStyle(
                //     fontSize: 15.0,
                //     color: Colors.white,
                //     fontFamily: "Comfortaa",
                //     decoration: TextDecoration.underline
                //   ),
                //   buttonSpacing: 10.0,
                //   headerTextStyle: TextStyle(
                //     fontSize: 15.0,
                //     color: Colors.white,
                //     fontFamily: "Comfortaa",
                //   ),
                //   hideSelectedTextCount: true,
                //   selectedChipTextStyle: TextStyle(
                //     fontSize: 15.0,
                //     color: Colors.white,
                //     fontFamily: "Comfortaa",
                //   ),
                //   selectedTextBackgroundColor: HexColor("#F8B50F"),
                //   unselectedChipTextStyle: TextStyle(
                //     fontSize: 15.0,
                //     color: Colors.black,
                //     fontFamily: "Comfortaa",
                //   ),
                //   controlContainerDecoration: BoxDecoration(
                //     color: Colors.transparent
                //   ),
                //   wrapAlignment: WrapAlignment.center,
                //   wrapCrossAxisAlignment: WrapCrossAlignment.center,
                //   validateSelectedItem: (list, val) {
                //     return list!.contains(val);
                //   },
                //   onItemSearch: (list, text) {
                //     return [];
                //   },
                //   onApplyButtonClick: (list) {
                //     //print(list);
                //     if (list!.isNotEmpty) {
                //       setState(() {
                //         selectedJenisSimpanan = List.from(list);
                //         this.listDatas = this.temp.where((element) => selectedJenisSimpanan.contains(element.simpanan.jenisSimpanan)).toList();
                //       });
                //     } else {
                //       setState(() {
                //         selectedJenisSimpanan.clear();
                //         this.listDatas = this.temp;
                //       });
                //     }
                //     //print(selectedJenisSimpanan);
                //     Navigator.pop(context);
                //   }
                // )
                initiateState();
                showModalBottomSheet<void>(
                  context: context,
                  elevation: 10.0,
                  isScrollControlled: true,
                  backgroundColor: HexColor("#50AEA7"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(29),
                        topLeft: Radius.circular(29)),
                  ),
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                      builder: (BuildContext context, StateSetter stateSetter){
                        return Container(
                          padding: EdgeInsets.all(20.0),
                          height: 315,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(29),
                            topLeft: Radius.circular(29)),
                            color: HexColor("#50AEA7"),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CustomText("Filter", 20.0, false)
                              ),
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText("Jenis Simpanan", 15.0, false),
                                  TextButton(
                                    onPressed: () {
                                      if(this.stateJenisSimpanan.every((element) => element == true)){
                                        clearAllChosenJenisSimpanan(stateSetter);
                                      } else {
                                        pilihSemuaJenisSimpanan(stateSetter);
                                      }
                                    },
                                    child: Text(
                                      this.stateJenisSimpanan.every((element) => element == true) ? "Clear" : "Pilih Semua",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.underline
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List<Widget>.generate(
                                  jenisSimpanan.length,
                                  (int index){
                                    return ChoiceChip(
                                      label: Text(
                                        jenisSimpanan[index],
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: this.stateJenisSimpanan[index] ? Colors.white : Colors.black,
                                          fontFamily: 'Comfortaa'
                                        ),
                                      ),
                                      selected: this.stateJenisSimpanan[index],
                                      elevation: 10.0,
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.all(5.0),
                                      selectedColor: HexColor("#F8B50F"),
                                      onSelected: (bool value){
                                        setValueJenisSimpanan(index, stateSetter, value);
                                      },
                                    );
                                  }
                                ).toList(),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 100,
                                  child: ElevatedButton(
                                      onPressed: (){
                                        var i = 0;
                                        this.selectedJenisSimpanan = [];
                                        while(i < this.stateJenisSimpanan.length){
                                          if(this.stateJenisSimpanan[i]){
                                            this.selectedJenisSimpanan.add(this.riwayatSimpanan.getDataJenisSimpanan().elementAt(i));
                                          }
                                          i++;
                                        }
                                        print(selectedJenisSimpanan);
                                        if (selectedJenisSimpanan.isNotEmpty) {
                                          setState(() {
                                            //this.temporaryState = stateJenisSimpanan;
                                            this.listDataRiwayatSimpanan = this.temp.where((element) => selectedJenisSimpanan.contains(element.jenisSimpanan)).toList();
                                          });
                                        } else {
                                          setState(() {
                                            selectedJenisSimpanan.clear();
                                            this.listDataRiwayatSimpanan = this.temp;
                                          });
                                        }
                                        //print(selectedJenisSimpanan);
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          primary: HexColor("#F8B50F"),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          padding: EdgeInsets.all(5.0)
                                      ),
                                      child: CustomText("Filter", 15.0, false)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
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
          itemCount: listDataRiwayatSimpanan.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: InkWell(
                onTap: (){
                  print("lihat Detail $index");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DetailSimpananScreen(riwayatSimpanan: item[index],))
                  );
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
                          child: CustomText("${item[index].jenisSimpanan}", 15.0, false),
                        ),
                        SizedBox(height: 15.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("Saldo", 15.0, true),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("${formatCurrency.format(item[index].saldo)}", 15.0, false),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 150,
                            child: InkWell(
                              onTap: (){
                                print("lihat Detail $index");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        DetailSimpananScreen(riwayatSimpanan: item[index],))
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Lihat Detail',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                        fontFamily: 'Comfortaa',
                                        decoration: TextDecoration.underline
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
        SizedBox(height: 60.0,)
      ],
    );
  }
}