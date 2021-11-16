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

class FormPembiayaan2 extends StatefulWidget {
  final Pembiayaan pembiayaan;

  FormPembiayaan2({Key? key, required this.pembiayaan}) : super(key: key);

  @override
  _FormPembiayaan2State createState() => _FormPembiayaan2State(pembiayaan);
}

class _FormPembiayaan2State extends State<FormPembiayaan2> {
  final _formKey = GlobalKey<FormState>();
  late Pembiayaan datas;
  late DateTime tanggalAkad;
  late TextEditingController nilaiPPA;
  late MoneyMaskedTextController hargaJual;
  late TextEditingController angsuran;
  late TextEditingController tHPGajiTerakhir;
  late TextEditingController cashRatio;
  final Pembiayaan pembiayaan;

  late DateFormat dateFormat;

  _FormPembiayaan2State(this.pembiayaan);

  @override
  void initState() {
    datas = Pembiayaan.emptyConstructor();

    tanggalAkad = pembiayaan.tanggalAkad;
    nilaiPPA = TextEditingController(text: pembiayaan.nilaiPPA.toString());
    hargaJual = MoneyMaskedTextController(initialValue: pembiayaan.hargaJual.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    angsuran = TextEditingController(text: pembiayaan.angsuran.toString());
    tHPGajiTerakhir = TextEditingController(text: pembiayaan.tHPGajiTerakhir.toString());
    cashRatio = TextEditingController(text: pembiayaan.cashRatio.toString());
    
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('id');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: this._formKey,
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
                    this.pembiayaan.tanggalAkad = this.tanggalAkad;
                  });
                },
                currentTime: this.pembiayaan.tanggalAkad,
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
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText("${this.dateFormat.format(this.pembiayaan.tanggalAkad)}", 15.0, false),
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
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 156,
                child: ElevatedButton(
                  onPressed: (){
                    this.pembiayaan.nilaiPPA = int.parse(this.nilaiPPA.text);
                    this.pembiayaan.hargaJual = this.hargaJual.numberValue.toInt();
                    this.pembiayaan.angsuran = int.parse(this.angsuran.text);
                    this.pembiayaan.tHPGajiTerakhir = int.parse(this.tHPGajiTerakhir.text);
                    this.pembiayaan.cashRatio = int.parse(this.cashRatio.text);

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 32.0,
                          color: Colors.white,
                        ),
                        backgroundColor: HexColor("#F8B50F"),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        "Sebelumnya",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: HexColor("#F8B50F"),
                            fontFamily: 'Comfortaa',
                            decoration: TextDecoration.underline
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                child: ElevatedButton(
                  onPressed: (){
                    print("${pembiayaan.peruntukkan1} - ${pembiayaan.peruntukkan2} - ${this.hargaJual.numberValue}");
                    // if(_formKey.currentState!.validate()){
                    //   this.pembiayaan.nilaiPPA = int.parse(this.nilaiPPA.text);
                    //   this.pembiayaan.hargaJual = int.parse(this.hargaJual.text);
                    //   this.pembiayaan.angsuran = int.parse(this.angsuran.text);
                    //   this.pembiayaan.tHPGajiTerakhir = int.parse(this.tHPGajiTerakhir.text);
                    //   this.pembiayaan.cashRatio = int.parse(this.cashRatio.text);
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Selanjutnya",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: HexColor("#F8B50F"),
                            fontFamily: 'Comfortaa',
                            decoration: TextDecoration.underline
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      CircleAvatar(
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 32.0,
                          color: Colors.white,
                        ),
                        backgroundColor: HexColor("#F8B50F"),
                      ),
                    ],
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