import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/models/pembiayaan/RiwayatPembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/DetailAngsuranScreen.dart';

class ContainerRiwayatPembiayaan extends StatefulWidget{
  @override
  _ContainerRiwayatPembiayaanState createState() => _ContainerRiwayatPembiayaanState();
}

class _ContainerRiwayatPembiayaanState extends State<ContainerRiwayatPembiayaan> {
  late RiwayatPembiayaan datas;
  late List<RiwayatPembiayaan> listDatas;

  late Pembiayaan pembiayaan;

  List<RiwayatPembiayaan> temp = [];

  List<String> selectedTujuanPembiayaan = [];
  List<String> selectedJenisAkad = [];
  List<String> selectedStatusPembiayaan = [];

  late List<bool> stateTujuanPembiayaan;
  late List<bool> stateJenisAkad;
  late List<bool> stateStatusPembiayaan;

  @override
  void initState() {
    super.initState();
    datas = RiwayatPembiayaan(0, 0, "", "", "");

    this.listDatas = datas.getDataRiwayatPembiayaan();
    temp = this.listDatas;

    pembiayaan = Pembiayaan.emptyConstructor();

    stateTujuanPembiayaan = List.generate(this.pembiayaan.getDataPeruntukkan().length, (index) => false);
    stateJenisAkad = List.generate(this.pembiayaan.getDataJenisAkad().length, (index) => false);
    stateStatusPembiayaan = List.generate(this.pembiayaan.getDataStatus().length, (index) => false);
  }

  void initiateState(){
    if(selectedTujuanPembiayaan.isEmpty){
      stateTujuanPembiayaan = List.generate(this.pembiayaan.getDataPeruntukkan().length, (index) => false);
    } else {
      var i = 0;
      while(i < pembiayaan.getDataPeruntukkan().length){
        if(!selectedTujuanPembiayaan.contains(pembiayaan.getDataPeruntukkan().elementAt(i))){
          this.stateTujuanPembiayaan[i] = false;
        } else {
          this.stateTujuanPembiayaan[i] = true;
        }
        i++;
      }
    }

    if(selectedJenisAkad.isEmpty){
      stateJenisAkad = List.generate(this.pembiayaan.getDataJenisAkad().length, (index) => false);
    } else {
      var i = 0;
      while(i < pembiayaan.getDataJenisAkad().length){
        if(!selectedJenisAkad.contains(pembiayaan.getDataJenisAkad().elementAt(i))){
          this.stateJenisAkad[i] = false;
        } else {
          this.stateJenisAkad[i] = true;
        }
        i++;
      }
    }

    if(selectedStatusPembiayaan.isEmpty){
      stateStatusPembiayaan = List.generate(this.pembiayaan.getDataStatus().length, (index) => false);
    } else {
      var i = 0;
      while(i < pembiayaan.getDataStatus().length){
        if(!selectedStatusPembiayaan.contains(pembiayaan.getDataStatus().elementAt(i))){
          this.stateStatusPembiayaan[i] = false;
        } else {
          this.stateStatusPembiayaan[i] = true;
        }
        i++;
      }
    }
  }

  void setValueTujuanPembiayaan(index, stateSetter, value){
    stateSetter(() {
      stateTujuanPembiayaan[index] = value;
    });
  }

  void pilihSemuaTujuanPembiayaan(stateSetter){
    var i = 0;
    while(i < this.pembiayaan.getDataPeruntukkan().length){
      stateSetter((){
        this.stateTujuanPembiayaan[i] = true;
      });
      i++;
    }
  }

  void clearAllChosenTujuanPembiayaan(stateSetter){
    var i = 0;
    while(i < this.pembiayaan.getDataPeruntukkan().length){
      stateSetter((){
        this.stateTujuanPembiayaan[i] = false;
      });
      i++;
    }
  }

  void setValueJenisAkad(index, stateSetter, value){
    stateSetter(() {
      stateJenisAkad[index] = value;
    });
  }

  void pilihSemuaJenisAkad(stateSetter){
    var i = 0;
    while(i < this.pembiayaan.getDataJenisAkad().length){
      stateSetter((){
        this.stateJenisAkad[i] = true;
      });
      i++;
    }
  }

  void clearAllChosenJenisAkad(stateSetter){
    var i = 0;
    while(i < this.pembiayaan.getDataJenisAkad().length){
      stateSetter((){
        this.stateJenisAkad[i] = false;
      });
      i++;
    }
  }

  void setValueStatusPembiayaan(index, stateSetter, value){
    stateSetter(() {
      stateStatusPembiayaan[index] = value;
    });
  }

  void pilihSemuaStatusPembiayaan(stateSetter){
    var i = 0;
    while(i < this.pembiayaan.getDataStatus().length){
      stateSetter((){
        this.stateStatusPembiayaan[i] = true;
      });
      i++;
    }
  }

  void clearAllChosenStatusPembiayaan(stateSetter){
    var i = 0;
    while(i < this.pembiayaan.getDataStatus().length){
      stateSetter((){
        this.stateStatusPembiayaan[i] = false;
      });
      i++;
    }
  }

  void pilihSemua(stateSetter){
    this.pilihSemuaTujuanPembiayaan(stateSetter);
    this.pilihSemuaJenisAkad(stateSetter);
    this.pilihSemuaStatusPembiayaan(stateSetter);
  }

  void clearAll(stateSetter){
    this.clearAllChosenTujuanPembiayaan(stateSetter);
    this.clearAllChosenJenisAkad(stateSetter);
    this.clearAllChosenStatusPembiayaan(stateSetter);
  }

  void filter(){
    this.selectedTujuanPembiayaan = [];
    this.selectedJenisAkad = [];
    this.selectedStatusPembiayaan = [];

    var i = 0;
    while(i < this.stateTujuanPembiayaan.length){
      if(this.stateTujuanPembiayaan[i]){
        this.selectedTujuanPembiayaan.add(this.pembiayaan.getDataPeruntukkan().elementAt(i));
      }
      i++;
    }

    i = 0;
    while(i < this.stateJenisAkad.length){
      if(this.stateJenisAkad[i]){
        this.selectedJenisAkad.add(this.pembiayaan.getDataJenisAkad().elementAt(i));
      }
      i++;
    }

    i = 0;
    while(i < this.stateStatusPembiayaan.length){
      if(this.stateStatusPembiayaan[i]){
        this.selectedStatusPembiayaan.add(this.pembiayaan.getDataStatus().elementAt(i));
      }
      i++;
    }

    print(selectedTujuanPembiayaan);
    print(selectedJenisAkad);
    print(selectedStatusPembiayaan);

    if (selectedTujuanPembiayaan.isNotEmpty && selectedJenisAkad.isNotEmpty &&
        selectedStatusPembiayaan.isNotEmpty) {
      setState(() {
        this.listDatas = this.temp.where((element) =>
            selectedTujuanPembiayaan.contains(element.tujuanPembiayaan) &&
            selectedJenisAkad.contains(element.jenisAkad) &&
            selectedStatusPembiayaan.contains(element.statusPembiayaan)
        ).toList();
      });
    }
    else if(selectedTujuanPembiayaan.isNotEmpty && selectedJenisAkad.isNotEmpty){
      setState(() {
        this.listDatas = this.temp.where((element) =>
        selectedTujuanPembiayaan.contains(element.tujuanPembiayaan) &&
            selectedJenisAkad.contains(element.jenisAkad)
        ).toList();
      });
    }
    else if(selectedTujuanPembiayaan.isNotEmpty && selectedStatusPembiayaan.isNotEmpty){
      setState(() {
        this.listDatas = this.temp.where((element) =>
        selectedTujuanPembiayaan.contains(element.tujuanPembiayaan) &&
            selectedStatusPembiayaan.contains(element.statusPembiayaan)
        ).toList();
      });
    }
    else if(selectedJenisAkad.isNotEmpty && selectedStatusPembiayaan.isNotEmpty){
      setState(() {
        this.listDatas = this.temp.where((element) =>
            selectedJenisAkad.contains(element.jenisAkad) &&
            selectedStatusPembiayaan.contains(element.statusPembiayaan)
        ).toList();
      });
    }
    else if(selectedTujuanPembiayaan.isNotEmpty){
      setState(() {
        this.listDatas = this.temp.where((element) =>
        selectedTujuanPembiayaan.contains(element.tujuanPembiayaan)
        ).toList();
      });
    }
    else if(selectedJenisAkad.isNotEmpty){
      setState(() {
        this.listDatas = this.temp.where((element) =>
            selectedJenisAkad.contains(element.jenisAkad)
        ).toList();
      });
    }
    else if(selectedStatusPembiayaan.isNotEmpty){
      setState(() {
        this.listDatas = this.temp.where((element) =>
            selectedStatusPembiayaan.contains(element.statusPembiayaan)
        ).toList();
      });
    }
    else {
      setState(() {
        selectedTujuanPembiayaan.clear();
        selectedJenisAkad.clear();
        selectedStatusPembiayaan.clear();
        this.listDatas = this.temp;
      });
    }
    //print(selectedJenisSimpanan);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final item = listDatas;
    //untuk data filter
    final tujuanPembiayaan = pembiayaan.getDataPeruntukkan();
    final jenisAkad = pembiayaan.getDataJenisAkad();
    final statusPembiayaan = pembiayaan.getDataStatus();
    final formatCurrency = new NumberFormat.currency(locale: "id_ID", symbol: "Rp", decimalDigits: 0);

    return temp.length > 0 ? Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 100.0,
            child: TextButton(
              onPressed: () {
                // await FilterListDialog.display<String>(
                //     context,
                //     listData: filterCategory,
                //     selectedListData: selectedJenisPembiayaan,
                //     height: 400,
                //     headlineText: "Filter by Tujuan Pembiayaan",
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
                //       //print(list);
                //       if (list!.isNotEmpty) {
                //         setState(() {
                //           selectedJenisPembiayaan = List.from(list);
                //
                //           this.listDatas = this.temp.where((element){
                //            return selectedJenisPembiayaan.contains(element.tujuanPembiayaan) &&
                //                selectedJenisPembiayaan.contains(element.jenisAkad) &&
                //                selectedJenisPembiayaan.contains(element.statusPembiayaan);
                //           }
                //           ).toList();
                //         });
                //       } else {
                //         setState(() {
                //           selectedJenisPembiayaan.clear();
                //           this.listDatas = this.temp;
                //         });
                //       }
                //       //print(selectedJenisSimpanan);
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
                          height: 651,
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
                                  CustomText("Tujuan Pembiayaan", 15.0, false),
                                  TextButton(
                                    onPressed: () {
                                      if(this.stateTujuanPembiayaan.every((element) => element == true)){
                                        clearAllChosenTujuanPembiayaan(stateSetter);
                                      } else {
                                        pilihSemuaTujuanPembiayaan(stateSetter);
                                      }
                                    },
                                    child: Text(
                                      this.stateTujuanPembiayaan.every((element) => element == true) ? "Clear" : "Pilih Semua",
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
                                    tujuanPembiayaan.length,
                                        (int index){
                                      return ChoiceChip(
                                        label: Text(
                                          tujuanPembiayaan[index],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: this.stateTujuanPembiayaan[index] ? Colors.white : Colors.black,
                                              fontFamily: 'Comfortaa'
                                          ),
                                        ),
                                        selected: this.stateTujuanPembiayaan[index],
                                        elevation: 10.0,
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(5.0),
                                        selectedColor: HexColor("#F8B50F"),
                                        onSelected: (bool value){
                                          setValueTujuanPembiayaan(index, stateSetter, value);
                                        },
                                      );
                                    }
                                ).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText("Jenis Akad", 15.0, false),
                                  TextButton(
                                    onPressed: () {
                                      if(this.stateJenisAkad.every((element) => element == true)){
                                        clearAllChosenJenisAkad(stateSetter);
                                      } else {
                                        pilihSemuaJenisAkad(stateSetter);
                                      }
                                    },
                                    child: Text(
                                      this.stateJenisAkad.every((element) => element == true) ? "Clear" : "Pilih Semua",
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
                                    jenisAkad.length,
                                        (int index){
                                      return ChoiceChip(
                                        label: Text(
                                          jenisAkad[index],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: this.stateJenisAkad[index] ? Colors.white : Colors.black,
                                              fontFamily: 'Comfortaa'
                                          ),
                                        ),
                                        selected: this.stateJenisAkad[index],
                                        elevation: 10.0,
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(5.0),
                                        selectedColor: HexColor("#F8B50F"),
                                        onSelected: (bool value){
                                          setValueJenisAkad(index, stateSetter, value);
                                        },
                                      );
                                    }
                                ).toList(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText("Status Pembiayaan", 15.0, false),
                                  TextButton(
                                    onPressed: () {
                                      if(this.stateStatusPembiayaan.every((element) => element == true)){
                                        clearAllChosenStatusPembiayaan(stateSetter);
                                      } else {
                                        pilihSemuaStatusPembiayaan(stateSetter);
                                      }
                                    },
                                    child: Text(
                                      this.stateStatusPembiayaan.every((element) => element == true) ? "Clear" : "Pilih Semua",
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
                                    statusPembiayaan.length,
                                        (int index){
                                      return ChoiceChip(
                                        label: Text(
                                          statusPembiayaan[index],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: this.stateStatusPembiayaan[index] ? Colors.white : Colors.black,
                                              fontFamily: 'Comfortaa'
                                          ),
                                        ),
                                        selected: this.stateStatusPembiayaan[index],
                                        elevation: 10.0,
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(5.0),
                                        selectedColor: HexColor("#F8B50F"),
                                        onSelected: (bool value){
                                          setValueStatusPembiayaan(index, stateSetter, value);
                                        },
                                      );
                                    }
                                ).toList(),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(
                                          onPressed: (){
                                            this.pilihSemua(stateSetter);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 10,
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.0),
                                              ),
                                              padding: EdgeInsets.all(5.0)
                                          ),
                                          child: Text(
                                            "Pilih Semua",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black,
                                              fontFamily: 'Comfortaa'
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(
                                          onPressed: (){
                                            this.clearAll(stateSetter);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 10,
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12.0),
                                              ),
                                              padding: EdgeInsets.all(5.0)
                                          ),
                                          child: Text(
                                            "Clear All",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontFamily: 'Comfortaa'
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Expanded(
                                    child: Container(
                                      child: ElevatedButton(
                                          onPressed: (){
                                            filter();
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
                              )
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          DetailAngsuranScreen(idRiwayatPembiayaan: index))
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
                            width: 80,
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              color: item[index].statusPembiayaan == "Lunas" ? HexColor("#00C851") : Colors.orange,
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        DetailAngsuranScreen(idRiwayatPembiayaan: index))
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
    )
    : CustomText("Belum ada riwayat pembiayaan", 15.0, true);
  }
}