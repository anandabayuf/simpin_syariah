import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/models/investasi/Investasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/investasi/screens/AjukanInvestasiScreen2.dart';

class FormInvestasi1 extends StatefulWidget {
  final Investasi investasi;

  FormInvestasi1({Key? key, required this.investasi}) : super(key: key);

  @override
  _FormInvestasi1State createState() => _FormInvestasi1State(investasi);
}

class _FormInvestasi1State extends State<FormInvestasi1> {
  final formKeyScreen1 = GlobalKey<FormState>();

  late Investasi datas;

  final Investasi investasi;

  late TextEditingController namaAnggota;
  late String jenis;
  late String produk;
  late String journal;
  late String analyticAcc;
  late String ahliWaris;
  late String paketInvestasi;
  late String quantity;

  _FormInvestasi1State(this.investasi);

  @override
  void initState() {
    datas = Investasi.emptyConstructor();

    this.namaAnggota = TextEditingController(text: this.investasi.namaAnggota);
    this.jenis = this.investasi.jenisInvestasi;
    this.produk = this.investasi.produk;
    this.journal = this.investasi.journal;
    this.analyticAcc = this.investasi.analyticAccount;
    this.ahliWaris = this.investasi.ahliWaris;
    this.paketInvestasi = this.investasi.paketInvestasi;
    this.quantity = this.investasi.quantity;

    super.initState();
  }

  @override
  void dispose() {
    this.namaAnggota.dispose();
    super.dispose();
  }

  void saveAllDataInvestasi(){
    setState(() {
      this.investasi.namaAnggota = this.namaAnggota.text;
      this.investasi.jenisInvestasi = this.jenis;
      this.investasi.produk = this.produk;
      this.investasi.journal = this.journal;
      this.investasi.analyticAccount = this.analyticAcc;
      this.investasi.ahliWaris = this.ahliWaris;
      this.investasi.paketInvestasi = this.paketInvestasi;
      this.investasi.quantity = this.quantity;
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
              child: CustomText('Nama Anggota', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this.namaAnggota,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontFamily: "Comfortaa"
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan Nama Anggota',
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
                return 'Nama Anggota harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Jenis Investasi', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Jenis Investasi',
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
                this.jenis = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownJenisInvestasi().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Produk', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Produk',
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
                this.produk = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownProduk().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Journal', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Journal',
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
              color: Colors.white.withOpacity(0.5),
              size: 24.0,
            ),
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: "Comfortaa"
            ),
            onChanged: null,
            // validator: (String? value){
            //   if(value == null){
            //     return "harus diisi";
            //   }
            //   return null;
            // },
            items: datas.dataDropDownJournal().map<DropdownMenuItem<String>>((String value) {
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
              color: Colors.white.withOpacity(0.5),
              size: 24.0,
            ),
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: "Comfortaa"
            ),
            onChanged: null,
            // validator: (String? value){
            //   if(value == null){
            //     return "harus diisi";
            //   }
            //   return null;
            // },
            items: datas.dataDropDownAnalyticAccount().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Ahli Waris', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Ahli Waris',
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
                this.ahliWaris = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownAhliWaris().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Paket Investasi', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Paket Investasi',
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
                this.paketInvestasi = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownPaketInvestasi().map<DropdownMenuItem<String>>((String value) {
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
              child: CustomText('Quantity', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          DropdownButtonFormField(
            elevation: 5,
            decoration: InputDecoration(
              hintText: 'Pilih Quantity',
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
                this.quantity = newValue!;
              });
            },
            validator: (String? value){
              if(value == null){
                return "harus diisi";
              }
              return null;
            },
            items: datas.dataDropDownQuantity().map<DropdownMenuItem<String>>((String value) {
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
          SizedBox(height: 30.0,),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 180,
              height: 57,
              child: ElevatedButton(
                onPressed: (){
                  this.saveAllDataInvestasi();
                  print(
                      "nama anggota : ${this.investasi.namaAnggota}\n"
                      "jenis investasi : ${this.investasi.jenisInvestasi}\n"
                      "produk : ${this.investasi.produk}\n"
                      "journal : ${this.investasi.journal}\n"
                      "analytic acc : ${this.investasi.analyticAccount}\n"
                      "ahli waris : ${this.investasi.ahliWaris}\n"
                      "paket investasi : ${this.investasi.paketInvestasi}\n"
                      "quantity : ${this.investasi.quantity}\n"
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AjukanInvestasiScreen2(investasi: investasi, formKeyScreen1: formKeyScreen1,))
                  );
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
      ),
    );
  }
}