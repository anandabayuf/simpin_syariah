import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/AjukanPembiayaanScreen2.dart';

class FormPembiayaan1 extends StatefulWidget {
  final Pembiayaan pembiayaan;

  FormPembiayaan1({Key? key, required this.pembiayaan}) : super(key: key);

  @override
  _FormPembiayaan1State createState() => _FormPembiayaan1State(pembiayaan);
}

class _FormPembiayaan1State extends State<FormPembiayaan1> {
  final formKeyScreen1 = GlobalKey<FormState>();

  late Pembiayaan datas;

  final Pembiayaan pembiayaan;

  late String peruntukkan1Value;
  late String peruntukkan2Value;
  late String jenisAkad;
  late String pemindahanHak;
  late String vendor;
  late String rekPihakKetiga;
  late String analyticAcc;

  _FormPembiayaan1State(this.pembiayaan);

  @override
  void initState() {
    datas = Pembiayaan.emptyConstructor();

    this.peruntukkan1Value = this.pembiayaan.peruntukkan1;
    this.peruntukkan2Value = this.pembiayaan.peruntukkan2;
    this.jenisAkad = this.pembiayaan.jenisAkad;
    this.pemindahanHak = this.pembiayaan.pemindahanHak;
    this.vendor = this.pembiayaan.vendor;
    this.rekPihakKetiga = this.pembiayaan.rekPihakKetiga;
    this.analyticAcc = this.pembiayaan.analyticAcc;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void saveAllDataPembiayaan(){
    setState(() {
      this.pembiayaan.peruntukkan1 = this.peruntukkan1Value;
      this.pembiayaan.peruntukkan2 = this.peruntukkan2Value;
      this.pembiayaan.jenisAkad = this.jenisAkad;
      this.pembiayaan.pemindahanHak = this.pemindahanHak;
      this.pembiayaan.vendor = this.vendor;
      this.pembiayaan.rekPihakKetiga = this.rekPihakKetiga;
      this.pembiayaan.analyticAcc = this.analyticAcc;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: this.formKeyScreen1,
      child: Column(
        children: [
          Container(
            width: screenSize.width,
            child: CustomText('Peruntukkan', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Peruntukkan',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.peruntukkan1Value = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataPeruntukkan().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Peruntukkan', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Peruntukkan',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.peruntukkan2Value = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataPeruntukkan().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Jenis Akad', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Jenis Akad',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.jenisAkad = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataJenisAkad().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Pemindahan Hak', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Pemindahan Hak',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.pemindahanHak = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataPemindahanHak().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Vendor', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Vendor',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.vendor = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataVendor().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Rekening Pihak Ketiga', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Rekening Pihak Ketiga',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.rekPihakKetiga = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataRekPihakKetiga().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Analytic Account', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Analytic Account',
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
              if (this.formKeyScreen1.currentState!.validate()) {

              }
              setState(() {
                this.analyticAcc = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.getDataAnalyticAccount().map<DropdownMenuItem<String>>((String value) {
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
          SizedBox(height: 20.0,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 150,
              child: ElevatedButton(
                onPressed: (){
                  this.saveAllDataPembiayaan();
                  print(
                      "peruntukkan 1 : ${this.pembiayaan.peruntukkan1}\n"
                          "peruntukkan 2 : ${this.pembiayaan.peruntukkan2}\n"
                          "jenis akad : ${this.pembiayaan.jenisAkad}\n"
                          "pemindahan hak : ${this.pembiayaan.pemindahanHak}\n"
                          "vendor : ${this.pembiayaan.vendor}\n"
                          "rek pihak ketiga : ${this.pembiayaan.rekPihakKetiga}\n"
                          "analytic acc : ${this.pembiayaan.analyticAcc}\n"
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AjukanPembiayaanScreen2(pembiayaan: pembiayaan, formKeyScreen1: formKeyScreen1,))
                  );
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
          ),
        ],
      ),
    );
  }
}