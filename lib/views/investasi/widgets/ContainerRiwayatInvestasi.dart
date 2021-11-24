import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
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

  late List<bool> stateJenisInvestasi;

  @override
  void initState() {
    super.initState();
    datas = new Investasi("", "", "", "", "", "", "", "", 0,
        "", DateTime.now(), DateTime.now(), "", 0, 0, 0,
        new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""), new XFile(""));

    this.listDatas = datas.getDataInvestasi();
    temp = this.listDatas;

    stateJenisInvestasi = List.generate(this.datas.dataDropDownJenisInvestasi().length, (index) => false);
  }

  void initiateState(){
    if(selectedJenisInvestasi.isEmpty){
      stateJenisInvestasi = List.generate(this.datas.dataDropDownJenisInvestasi().length, (index) => false);
    } else {
      var i = 0;
      while(i < datas.dataDropDownJenisInvestasi().length){
        if(!selectedJenisInvestasi.contains(datas.dataDropDownJenisInvestasi().elementAt(i))){
          this.stateJenisInvestasi[i] = false;
        } else {
          this.stateJenisInvestasi[i] = true;
        }
        i++;
      }
    }
  }

  void setValueJenisInvestasi(index, stateSetter, value){
    stateSetter(() {
      stateJenisInvestasi[index] = value;
    });
  }

  void pilihSemuaJenisInvestasi(stateSetter){
    var i = 0;
    while(i < this.datas.dataDropDownJenisInvestasi().length){
      stateSetter((){
        this.stateJenisInvestasi[i] = true;
      });
      i++;
    }
  }

  void clearAllChosenJenisInvestasi(stateSetter){
    var i = 0;
    while(i < this.datas.dataDropDownJenisInvestasi().length){
      stateSetter((){
        this.stateJenisInvestasi[i] = false;
      });
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = listDatas;
    final jenisInvestasi = this.datas.dataDropDownJenisInvestasi();

    return temp.length > 0 ? Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100.0,
            child: TextButton(
              onPressed: () async {
                // print("filter");
                // await FilterListDialog.display<String>(
                //     context,
                //     listData: this.datas.dataDropDownJenisInvestasi(),
                //     selectedListData: selectedJenisInvestasi,
                //     height: 300,
                //     headlineText: "Filter by Jenis Investasi",
                //     choiceChipLabel: (item) {
                //       return item;
                //     },
                //     hideSearchField: true,
                //     backgroundColor: Colors.white.withOpacity(0.5),//HexColor("#F8B50F"),
                //     closeIconColor: Colors.red,
                //     allButtonText: "Pilih Semua",
                //     applyButonTextBackgroundColor: HexColor("#F8B50F"),
                //     applyButtonText: "Filter",
                //     applyButtonTextStyle: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.white,
                //       fontFamily: "Comfortaa",
                //     ),
                //     controlButtonTextStyle: TextStyle(
                //         fontSize: 15.0,
                //         color: Colors.white,
                //         fontFamily: "Comfortaa",
                //         decoration: TextDecoration.underline
                //     ),
                //     buttonSpacing: 10.0,
                //     headerTextStyle: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.white,
                //       fontFamily: "Comfortaa",
                //     ),
                //     hideSelectedTextCount: true,
                //     selectedChipTextStyle: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.white,
                //       fontFamily: "Comfortaa",
                //     ),
                //     selectedTextBackgroundColor: HexColor("#F8B50F"),
                //     unselectedChipTextStyle: TextStyle(
                //       fontSize: 15.0,
                //       color: Colors.black,
                //       fontFamily: "Comfortaa",
                //     ),
                //     controlContainerDecoration: BoxDecoration(
                //         color: Colors.transparent
                //     ),
                //     wrapAlignment: WrapAlignment.center,
                //     wrapCrossAxisAlignment: WrapCrossAlignment.center,
                //     validateSelectedItem: (list, val) {
                //       return list!.contains(val);
                //     },
                //     onItemSearch: (list, text) {
                //       return [];
                //     },
                //     onApplyButtonClick: (list) {
                //       if (list!.isNotEmpty) {
                //         setState(() {
                //           selectedJenisInvestasi = List.from(list);
                //           this.listDatas = this.temp.where((element) => selectedJenisInvestasi.contains(element.jenisInvestasi)).toList();
                //         });
                //       } else {
                //         setState(() {
                //           selectedJenisInvestasi.clear();
                //           this.listDatas = this.temp;
                //         });
                //       }
                //
                //       Navigator.pop(context);
                //     }
                // );
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
                          height: 315+144,
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
                                  CustomText("Jenis Investasi", 15.0, false),
                                  TextButton(
                                    onPressed: () {
                                      if(this.stateJenisInvestasi.every((element) => element == true)){
                                        clearAllChosenJenisInvestasi(stateSetter);
                                      } else {
                                        pilihSemuaJenisInvestasi(stateSetter);
                                      }
                                    },
                                    child: Text(
                                      this.stateJenisInvestasi.every((element) => element == true) ? "Clear" : "Pilih Semua",
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
                                    jenisInvestasi.length,
                                        (int index){
                                      return ChoiceChip(
                                        label: Text(
                                          jenisInvestasi[index],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: this.stateJenisInvestasi[index] ? Colors.white : Colors.black,
                                              fontFamily: 'Comfortaa'
                                          ),
                                        ),
                                        selected: this.stateJenisInvestasi[index],
                                        elevation: 10.0,
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(5.0),
                                        selectedColor: HexColor("#F8B50F"),
                                        onSelected: (bool value){
                                          setValueJenisInvestasi(index, stateSetter, value);
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
                                        this.selectedJenisInvestasi = [];
                                        while(i < this.stateJenisInvestasi.length){
                                          if(this.stateJenisInvestasi[i]){
                                            this.selectedJenisInvestasi.add(jenisInvestasi.elementAt(i));
                                          }
                                          i++;
                                        }
                                        //print(selectedJenisInvestasi);
                                        if (selectedJenisInvestasi.isNotEmpty) {
                                          setState(() {
                                            //this.temporaryState = stateJenisSimpanan;
                                            this.listDatas = this.temp.where((element) => selectedJenisInvestasi.contains(element.jenisInvestasi)).toList();
                                          });
                                          print(listDatas);
                                        } else {
                                          setState(() {
                                            selectedJenisInvestasi.clear();
                                            this.listDatas = this.temp;
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
          itemCount: listDatas.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: InkWell(
                onTap: (){
                  print("card ${index}");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) =>
                  //         DetailAngsuran(idRiwayatPembiayaan: index))
                  // );
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
                        SizedBox(height: 15.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("Jenis Pengembalian", 15.0, true),
                        ),
                        SizedBox(height: 5.0,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText("${item[index].pengembalian}", 15.0, false),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 150,
                            child: InkWell(
                              onTap: (){
                                print("lihat Detail ${index}");
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(builder: (context) =>
                                //         DetailAngsuran(idRiwayatPembiayaan: index))
                                // );
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
    ) : CustomText("Belum ada riwayat Investasi", 15.0, true);
  }
}