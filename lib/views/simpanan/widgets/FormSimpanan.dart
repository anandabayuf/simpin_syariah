import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/simpanan/Simpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/simpanan/widgets/ConfirmationDialog.dart';

class FormSimpanan extends StatefulWidget {
  final Simpanan simpanan;

  FormSimpanan({Key? key, required this.simpanan}) : super(key: key);

  @override
  _FormSimpananState createState() => _FormSimpananState(simpanan);
}

class _FormSimpananState extends State<FormSimpanan> {
  final formkey = GlobalKey<FormState>();

  late Simpanan datas;

  final Simpanan simpanan;

  late String jenisSimpanan;
  late MoneyMaskedTextController nominalSimpanan;

  _FormSimpananState(this.simpanan);

  @override
  void initState() {
    datas = Simpanan.emptyConstructor();

    this.jenisSimpanan = this.simpanan.jenisSimpanan;
    this.nominalSimpanan = MoneyMaskedTextController(initialValue: this.simpanan.nominalSimpanan.toDouble(), thousandSeparator: '.', leftSymbol: 'Rp ', precision: 0, decimalSeparator: '');

    super.initState();
  }

  @override
  void dispose() {
    this.nominalSimpanan.dispose();
    super.dispose();
  }

  void saveAllDataSimpanan(){
    setState(() {
      this.simpanan.jenisSimpanan = this.jenisSimpanan;
      this.simpanan.nominalSimpanan = this.nominalSimpanan.numberValue.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: this.formkey,
      child: Column(
        children: [
          Container(
              width: screenSize.width,
              child: CustomText('Jenis Simpanan', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Jenis Simpanan',
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
              if (this.formkey.currentState!.validate()) {

              }
              setState(() {
                this.jenisSimpanan = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataJenisSimpanan().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Nominal Simpanan', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.nominalSimpanan,
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
              hintText: 'Masukkan Nominal Simpanan',
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
                return 'Nominal Simpanan harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 150,
              child: ElevatedButton(
                onPressed: (){
                  this.saveAllDataSimpanan();
                  print(
                      "jenis simpanan : ${this.simpanan.jenisSimpanan}\n"
                      "nominal simpanan : ${this.simpanan.nominalSimpanan}\n"
                  );
                  if(this.formkey.currentState!.validate()){
                    print("berhasil");
                    showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) =>
                        ConfirmationDialog(context, this.simpanan)
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
                      "Tambah",
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
          ),
        ],
      ),
    );
  }
}