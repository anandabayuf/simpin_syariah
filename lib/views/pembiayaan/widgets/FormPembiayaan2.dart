import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/AjukanPembiayaanScreen3.dart';

class FormPembiayaan2 extends StatefulWidget {
  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;

  FormPembiayaan2({Key? key, required this.pembiayaan, required this.formKeyScreen1}) : super(key: key);

  @override
  _FormPembiayaan2State createState() => _FormPembiayaan2State(pembiayaan, formKeyScreen1);
}

class _FormPembiayaan2State extends State<FormPembiayaan2> {
  final formKeyScreen2 = GlobalKey<FormState>();

  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;

  late DateTime tanggalAkad;
  late MoneyMaskedTextController nilaiPPA;
  late MoneyMaskedTextController hargaJual;
  late TextEditingController angsuran;
  late MoneyMaskedTextController tHPGajiTerakhir;
  late TextEditingController cashRatio;

  late DateFormat dateFormat;

  _FormPembiayaan2State(this.pembiayaan, this.formKeyScreen1);

  @override
  void initState() {
    this.tanggalAkad = this.pembiayaan.tanggalAkad;
    this.nilaiPPA = MoneyMaskedTextController(initialValue: this.pembiayaan.nilaiPPA.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    this.hargaJual = MoneyMaskedTextController(initialValue: this.pembiayaan.hargaJual.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    this.angsuran = TextEditingController(text: this.pembiayaan.angsuran.toString());
    this.tHPGajiTerakhir = MoneyMaskedTextController(initialValue: this.pembiayaan.tHPGajiTerakhir.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    this.cashRatio = TextEditingController(text: this.pembiayaan.cashRatio.toString());
    
    initializeDateFormatting();
    this.dateFormat = new DateFormat.yMMMMd('id');

    super.initState();
  }

  @override
  void dispose() {
    this.nilaiPPA.dispose();
    this.hargaJual.dispose();
    this.angsuran.dispose();
    this.tHPGajiTerakhir.dispose();
    this.cashRatio.dispose();
    super.dispose();
  }

  void saveAllDataPembiayaan(){
    setState(() {
      this.pembiayaan.tanggalAkad = this.tanggalAkad;
      this.pembiayaan.nilaiPPA = this.nilaiPPA.numberValue.toInt();
      this.pembiayaan.hargaJual = this.hargaJual.numberValue.toInt();
      this.pembiayaan.angsuran = int.parse(this.angsuran.text);
      this.pembiayaan.tHPGajiTerakhir = this.tHPGajiTerakhir.numberValue.toInt();
      this.pembiayaan.cashRatio = int.parse(this.cashRatio.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: this.formKeyScreen2,
      child: Column(
        children: [
          Container(
              width: screenSize.width,
              child: CustomText('Tanggal Akad', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          InkWell(
            onTap: (){
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1970, 1, 1),
                maxTime: DateTime.now(),
                onConfirm: (date) {
                  print('confirm $date');
                  setState(() {
                    this.tanggalAkad = date;
                  });
                },
                currentTime: this.tanggalAkad,
                locale: LocaleType.id,
                theme: DatePickerTheme(
                  backgroundColor: HexColor("#F8B50F"),
                  itemStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: "Comfortaa"
                  ),
                  cancelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Comfortaa",
                    color: Colors.white
                  ),
                  doneStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Comfortaa",
                    color: HexColor("#24A0ED")
                  ),
                )
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("${this.dateFormat.format(this.tanggalAkad)}", 15.0, false),
                  Icon(
                    Icons.calendar_today_rounded,
                    size: 32.0,
                    color: Colors.white,
                  )
                ],
              )
            ),
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Nilai Pembiayaan Periode Angsuran', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.nilaiPPA,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontFamily: "Comfortaa"
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan Nilai Pembiayaan Periode Angsuran',
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15.0,
                fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'Nilai Pembiayaan Periode Angsuran harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Harga Jual', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.hargaJual,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: "Comfortaa"
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan Harga Jual',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white
                ),
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'Harga Jual harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Angsuran', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.angsuran,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: "Comfortaa"
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan Angsuran',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white
                ),
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'Angsuran harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('THP Gaji Terakhir', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.tHPGajiTerakhir,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: "Comfortaa"
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan THP Gaji Terakhir',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white
                ),
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'THP Gaji Terakhir harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Cash Ratio', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.cashRatio,
            textInputAction: TextInputAction.done,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: "Comfortaa"
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan Cash Ratio',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white
                ),
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'Cash Ratio harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 57,
                  child: ElevatedButton(
                    onPressed: (){
                      this.saveAllDataPembiayaan();

                      print(
                        "tanggal akad : ${this.pembiayaan.tanggalAkad}\n"
                        "nilai PPA : ${this.pembiayaan.nilaiPPA}\n"
                        "harga jual : ${this.pembiayaan.hargaJual}\n"
                        "angsuran : ${this.pembiayaan.angsuran}\n"
                        "thp gaji terakhir : ${this.pembiayaan.tHPGajiTerakhir}\n"
                        "cash ratio : ${this.pembiayaan.cashRatio}\n"
                      );

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.all(5.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          size: 32.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          "SEBELUMNYA",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Container(
                  height: 57,
                  child: ElevatedButton(
                    onPressed: (){
                      this.saveAllDataPembiayaan();

                      print(
                          "tanggal akad : ${this.pembiayaan.tanggalAkad}\n"
                              "nilai PPA : ${this.pembiayaan.nilaiPPA}\n"
                              "harga jual : ${this.pembiayaan.hargaJual}\n"
                              "angsuran : ${this.pembiayaan.angsuran}\n"
                              "thp gaji terakhir : ${this.pembiayaan.tHPGajiTerakhir}\n"
                              "cash ratio : ${this.pembiayaan.cashRatio}\n"
                      );

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AjukanPembiayaanScreen3(pembiayaan: pembiayaan,
                            formKeyScreen1: this.formKeyScreen1, formKeyScreen2: this.formKeyScreen2,))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: Colors.white.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "SELANJUTNYA",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 32.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}