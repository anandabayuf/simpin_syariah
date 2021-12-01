import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:project_simpin_syariah/views/investasi/screens/AjukanInvestasiScreen3.dart';

class FormInvestasi2 extends StatefulWidget {
  final Investasi investasi;
  final GlobalKey<FormState> formKeyScreen1;

  FormInvestasi2({Key? key, required this.investasi, required this.formKeyScreen1}) : super(key: key);

  @override
  _FormInvestasi2State createState() => _FormInvestasi2State(investasi, formKeyScreen1);
}

class _FormInvestasi2State extends State<FormInvestasi2> {
  final formKeyScreen2 = GlobalKey<FormState>();

  late Investasi datas;
  
  final Investasi investasi;
  final GlobalKey<FormState> formKeyScreen1;

  late MoneyMaskedTextController totalInvestasi;
  late String jangkaWaktu;
  late DateTime tanggalMulai;
  late DateTime tanggalAkhir;
  late String pengembalian;
  late MoneyMaskedTextController nisbahInvestor;
  late MoneyMaskedTextController equivalentRate;
  late MoneyMaskedTextController pajak;

  late DateFormat dateFormat;

  _FormInvestasi2State(this.investasi, this.formKeyScreen1);

  @override
  void initState() {
    datas = Investasi.emptyConstructor();

    this.totalInvestasi = MoneyMaskedTextController(initialValue: this.investasi.totalInvestasi.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    this.jangkaWaktu = this.investasi.jangkaWaktu;
    this.tanggalMulai = this.investasi.tanggalMulai;
    this.tanggalAkhir = this.investasi.tanggalAkhir;
    this.pengembalian = this.investasi.pengembalian;
    this.nisbahInvestor = MoneyMaskedTextController(initialValue: this.investasi.nisbahInvestor.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    this.equivalentRate = MoneyMaskedTextController(initialValue: this.investasi.equivalentRate.toDouble(), precision: 2, decimalSeparator: ',', rightSymbol: '%');
    this.pajak = MoneyMaskedTextController(initialValue: this.investasi.pajak.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');

    initializeDateFormatting();
    this.dateFormat = new DateFormat.yMMMMd('id');

    super.initState();
  }

  @override
  void dispose() {
    // this.totalInvestasi.dispose();
    // this.nisbahInvestor.dispose();
    // this.equivalentRate.dispose();
    // this.pajak.dispose();
    super.dispose();
  }

  void saveAllDataInvestasi(){
    setState(() {
      this.investasi.totalInvestasi = this.totalInvestasi.numberValue.toInt();
      this.investasi.jangkaWaktu = this.jangkaWaktu;
      this.investasi.tanggalMulai = this.tanggalMulai;
      this.investasi.tanggalAkhir = this.tanggalAkhir;
      this.investasi.pengembalian = this.pengembalian;
      this.investasi.nisbahInvestor = this.nisbahInvestor.numberValue.toInt();
      this.investasi.equivalentRate = this.equivalentRate.numberValue;
      this.investasi.pajak = this.pajak.numberValue.toInt();
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
              child: CustomText('Total Investasi', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.totalInvestasi,
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
              hintText: 'Masukkan Total Investasi',
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
                return 'Total Investasi harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Jangka Waktu', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            value: this.jangkaWaktu != "" ? this.jangkaWaktu : null,
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Jangka Waktu',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: 'Comfortaa'
              ),
              fillColor: Colors.white.withOpacity(0.5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.red
                  )
              ),
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 24.0,
            ),
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: "Comfortaa"
            ),
            onChanged: (String? newValue) {
              setState(() {
                this.jangkaWaktu = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownJangkaWaktu().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Tanggal Mulai', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          InkWell(
            onTap: (){
              DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      this.tanggalMulai = date;
                      if(this.tanggalAkhir.isBefore(this.tanggalMulai) ||
                          this.tanggalAkhir.isAtSameMomentAs(this.tanggalMulai)){
                        this.tanggalAkhir = this.tanggalMulai.add(Duration(days: 1));
                      }
                    });
                  },
                  currentTime: this.tanggalMulai,
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
                    CustomText("${this.dateFormat.format(this.tanggalMulai)}", 15.0, false),
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
              child: CustomText('Tanggal Akhir', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          InkWell(
            onTap: (){
              DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: this.tanggalMulai.add(Duration(days: 1)),
                  onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      this.tanggalAkhir = date;
                    });
                  },
                  currentTime: this.tanggalAkhir,
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
                    CustomText("${this.dateFormat.format(this.tanggalAkhir)}", 15.0, false),
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
              child: CustomText('Pengembalian', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            value: this.pengembalian != "" ? this.pengembalian : null,
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Pengembalian',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: 'Comfortaa'
              ),
              fillColor: Colors.white.withOpacity(0.5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.red
                  )
              ),
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 24.0,
            ),
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: "Comfortaa"
            ),
            onChanged: (String? newValue) {
              setState(() {
                this.pengembalian = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownPengembalian().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontFamily: 'Comfortaa'
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Nisbah Investor', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            readOnly: true,
            //controller: this.nisbahInvestor,
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
              hintText: 'Masukkan Nisbah Investor',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            // validator: (String? value) {
            //   if (value == '' || value!.trim() == '') {
            //     return 'Nisbah Investor harus diisi';
            //   }
            //   return null;
            // },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Equivalent Rate', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            readOnly: true,
            //controller: this.equivalentRate,
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
              hintText: 'Masukkan Equivalent Rate',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            // validator: (String? value) {
            //   if (value == '' || value!.trim() == '') {
            //     return 'Equivalent Rate harus diisi';
            //   }
            //   return null;
            // },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Pajak', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            readOnly: true,
            //controller: this.pajak,
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
              hintText: 'Masukkan Pajak',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0,
                  fontFamily: "Comfortaa"
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
            // validator: (String? value) {
            //   if (value == '' || value!.trim() == '') {
            //     return 'Pajak harus diisi';
            //   }
            //   return null;
            // },
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
                      this.saveAllDataInvestasi();

                      print(
                        "total investasi : ${this.investasi.totalInvestasi}\n"
                        "jangka waktu : ${this.investasi.jangkaWaktu}\n"
                        "tanggal mulai : ${this.investasi.tanggalMulai}\n"
                        "tanggal akhir : ${this.investasi.tanggalAkhir}\n"
                        "pengembalian : ${this.investasi.pengembalian}\n"
                        "nisbah investor : ${this.investasi.nisbahInvestor}\n"
                        "equivalent rate : ${this.investasi.equivalentRate}\n"
                        "pajak : ${this.investasi.pajak}\n"
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
                      this.saveAllDataInvestasi();

                      print(
                        "total investasi : ${this.investasi.totalInvestasi}\n"
                        "jangka waktu : ${this.investasi.jangkaWaktu}\n"
                        "tanggal mulai : ${this.investasi.tanggalMulai}\n"
                        "tanggal akhir : ${this.investasi.tanggalAkhir}\n"
                        "pengembalian : ${this.investasi.pengembalian}\n"
                        "nisbah investor : ${this.investasi.nisbahInvestor}\n"
                        "equivalent rate : ${this.investasi.equivalentRate}\n"
                        "pajak : ${this.investasi.pajak}\n"
                      );

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AjukanInvestasiScreen3(investasi: investasi,
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