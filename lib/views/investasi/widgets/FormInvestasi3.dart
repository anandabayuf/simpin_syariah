import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';
import 'package:project_simpin_syariah/views/investasi/widgets/ConfirmationDialog.dart';

class FormInvestasi3 extends StatefulWidget {
  final Investasi investasi;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;

  FormInvestasi3({Key? key, required this.investasi, required this.formKeyScreen1,
    required this.formKeyScreen2}) : super(key: key);

  @override
  _FormInvestasi3State createState() => _FormInvestasi3State(investasi, this.formKeyScreen1, this.formKeyScreen2);
}

class _FormInvestasi3State extends State<FormInvestasi3> {
  final _formKey = GlobalKey<FormState>();

  final Investasi investasi;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;

  late MoneyMaskedTextController nisbahInvestor;
  late MoneyMaskedTextController equivalentRate;
  late MoneyMaskedTextController pajak;

  _FormInvestasi3State(this.investasi, this.formKeyScreen1, this.formKeyScreen2);

  @override
  void initState() {
    this.nisbahInvestor = MoneyMaskedTextController(initialValue: this.investasi.nisbahInvestor.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');
    this.equivalentRate = MoneyMaskedTextController(initialValue: this.investasi.equivalentRate.toDouble(), precision: 2, decimalSeparator: ',', rightSymbol: '%');
    this.pajak = MoneyMaskedTextController(initialValue: this.investasi.pajak.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');

    super.initState();
  }

  @override
  void dispose() {
    this.nisbahInvestor.dispose();
    this.equivalentRate.dispose();
    this.pajak.dispose();
    super.dispose();
  }

  void saveAllDataInvestasi(){
    setState(() {
      this.investasi.nisbahInvestor = this.nisbahInvestor.numberValue.toInt();
      this.investasi.equivalentRate = this.equivalentRate.numberValue;
      this.investasi.pajak = this.pajak.numberValue.toInt();
    });
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
              child: CustomText('Nisbah Investor', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.nisbahInvestor,
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
                return 'Nisbah Investor harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Equivalent Rate', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.equivalentRate,
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
                return 'Equivalent Rate harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Pajak', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.pajak,
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
                return 'Pajak harus diisi';
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
                    this.saveAllDataInvestasi();
                    //..
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                    this.saveAllDataInvestasi();

                    if(this.formKeyScreen1.currentState!.validate() &&
                        this.formKeyScreen2.currentState!.validate() &&
                        this._formKey.currentState!.validate()){
                      //.
                      print(
                        "nama anggota : ${this.investasi.namaAnggota}\n"
                        "jenis investasi : ${this.investasi.jenisInvestasi}\n"
                        "produk : ${this.investasi.produk}\n"
                        "journal : ${this.investasi.journal}\n"
                        "analytic acc : ${this.investasi.analyticAccount}\n"
                        "ahli waris : ${this.investasi.ahliWaris}\n"
                        "paket investasi : ${this.investasi.paketInvestasi}\n"
                        "quantity : ${this.investasi.quantity}\n"
                        "total investasi : ${this.investasi.totalInvestasi}\n"
                        "jangka waktu : ${this.investasi.jangkaWaktu}\n"
                        "tanggal mulai : ${this.investasi.tanggalMulai}\n"
                        "tanggal akhir : ${this.investasi.tanggalAkhir}\n"
                        "pengembalian : ${this.investasi.pengembalian}\n"
                        "nisbah investor : ${this.investasi.nisbahInvestor}\n"
                        "equivalent rate : ${this.investasi.equivalentRate}\n"
                        "pajak : ${this.investasi.pajak}\n"
                      );
                      showDialog<String>(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) =>
                              ConfirmationDialog(context, investasi)
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          FailedInformation(context, "Data masih belum terisi semua, silakan periksa kembali")
                      );
                    }
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
                        "Ajukan",
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
                          Icons.check_rounded,
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