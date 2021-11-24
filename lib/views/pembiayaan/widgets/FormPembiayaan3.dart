import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';
import 'package:project_simpin_syariah/views/pembiayaan/widgets/ConfirmationDialog.dart';

class FormPembiayaan3 extends StatefulWidget {
  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;

  FormPembiayaan3({Key? key, required this.pembiayaan, required this.formKeyScreen1,
    required this.formKeyScreen2}) : super(key: key);

  @override
  _FormPembiayaan3State createState() => _FormPembiayaan3State(pembiayaan, this.formKeyScreen1, this.formKeyScreen2);
}

class _FormPembiayaan3State extends State<FormPembiayaan3> {
  final _formKey = GlobalKey<FormState>();

  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;

  late XFile ktp;
  late XFile ktpPasangan;
  late XFile kk;
  late XFile slipGaji1;
  late XFile slipGaji2;
  late XFile slipGaji3;
  late XFile temp;

  final ImagePicker _picker = ImagePicker();

  _FormPembiayaan3State(this.pembiayaan, this.formKeyScreen1, this.formKeyScreen2);

  @override
  void initState() {
    this.ktp = this.pembiayaan.ktpFile;
    this.ktpPasangan = this.pembiayaan.ktpPasanganFile;
    this.kk = this.pembiayaan.kartuKeluargaFile;
    this.slipGaji1 = this.pembiayaan.slipGaji1File;
    this.slipGaji2 = this.pembiayaan.slipGaji2File;
    this.slipGaji3 = this.pembiayaan.slipGaji3File;

    this.temp = XFile('');

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void uploadImageKTP() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.ktp = image!;
      //this.pembiayaan.ktpFile = this.ktp;
    });
  }

  void uploadImageKTPPasangan() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.ktpPasangan = image!;
      //this.pembiayaan.ktpFile = this.ktp;
    });
  }

  void uploadImageKartuKeluarga() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.kk = image!;
      //this.pembiayaan.ktpFile = this.ktp;
    });
  }

  void uploadImageSlipGaji1() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.slipGaji1 = image!;
      //this.pembiayaan.ktpFile = this.ktp;
    });
  }

  void uploadImageSlipGaji2() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.slipGaji2 = image!;
      //this.pembiayaan.ktpFile = this.ktp;
    });
  }

  void uploadImageSlipGaji3() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.slipGaji3 = image!;
      //this.pembiayaan.ktpFile = this.ktp;
    });
  }

  void setPopUpImageKTP(){
    setState(() {
      this.temp = this.ktp;
    });
  }

  void setPopUpImageKTPPasangan(){
    setState(() {
      this.temp = this.ktpPasangan;
    });
  }

  void setPopUpImageKartuKeluarga(){
    setState(() {
      this.temp = this.kk;
    });
  }

  void setPopUpImageSlipGaji1(){
    setState(() {
      this.temp = this.slipGaji1;
    });
  }

  void setPopUpImageSlipGaji2(){
    setState(() {
      this.temp = this.slipGaji2;
    });
  }

  void setPopUpImageSlipGaji3(){
    setState(() {
      this.temp = this.slipGaji3;
    });
  }

  void onClickUploadImage(setState) async {
    // Pick an image
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.temp = image!;
    });
  }

  void onClickDeleteImage(setState){
    setState(() {
      this.temp = XFile('');
    });
  }

  void onClickSaveImageKTP(){
    setState(() {
      this.ktp = this.temp;
    });
  }

  void onClickSaveImageKTPPasangan(){
    setState(() {
      this.ktpPasangan = this.temp;
    });
  }

  void onClickSaveImageKartuKeluarga(){
    setState(() {
      this.kk = this.temp;
    });
  }

  void onClickSaveImageSlipGaji1(){
    setState(() {
      this.slipGaji1 = this.temp;
    });
  }

  void onClickSaveImageSlipGaji2(){
    setState(() {
      this.slipGaji2 = this.temp;
    });
  }

  void onClickSaveImageSlipGaji3(){
    setState(() {
      this.slipGaji3 = this.temp;
    });
  }

  void saveAllImage(){
    setState(() {
      this.pembiayaan.ktpFile = this.ktp;
      this.pembiayaan.ktpPasanganFile = this.ktpPasangan ;
      this.pembiayaan.kartuKeluargaFile = this.kk;
      this.pembiayaan.slipGaji1File = this.slipGaji1;
      this.pembiayaan.slipGaji2File = this.slipGaji2;
      this.pembiayaan.slipGaji3File = this.slipGaji3;
    });
  }

  bool isAllImageUploaded(){
    return this.pembiayaan.ktpFile.path != "" &&
        this.pembiayaan.ktpPasanganFile.path != "" &&
        this.pembiayaan.kartuKeluargaFile.path != "" &&
        this.pembiayaan.slipGaji1File.path != "" &&
        this.pembiayaan.slipGaji2File.path != "" &&
        this.pembiayaan.slipGaji3File.path != "";
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: this._formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 170,
                  child: Card(
                    color: HexColor("#F8B50F"),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          this.ktp.path != '' ? InkWell(
                            onTap: () {
                              print("image clicked");

                              this.setPopUpImageKTP();

                              showDialog<String>(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (context, StateSetter setState) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white.withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(19.0)
                                          ),
                                        ),
                                        elevation: 5.0,
                                        title: Column(
                                          children: [
                                            CustomText("KTP", 15.0, false),
                                            SizedBox(height: 10),
                                            this.temp.path == "" ?
                                            CustomText("Gambar Belum Di-upload", 15.0, true)
                                              : Image.file(
                                              File(this.temp.path),
                                              width: 315,
                                              height: 200,
                                            ),
                                            SizedBox(height: 20),
                                            Container(
                                              width: 186,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 10.0,
                                                    primary: HexColor("#F8B50F"),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12.0)
                                                    )
                                                ),
                                                onPressed: () {
                                                  //fungsi unggah
                                                  this.onClickUploadImage(setState);
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_circle_up,
                                                      size: 32.0,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 5.0,),
                                                    CustomText("Unggah", 15.0, false)
                                                  ],
                                                )
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              width: 186,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 10.0,
                                                  primary: HexColor("#FF0000"),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12.0)
                                                  )
                                                ),
                                                onPressed: () {
                                                  //fungsi hapus
                                                  this.onClickDeleteImage(setState);
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.delete,
                                                      size: 32.0,
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(width: 5.0,),
                                                    CustomText("Hapus", 15.0, false)
                                                  ],
                                                )
                                              ),
                                            ),
                                            SizedBox(height: 20.0,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 10.0,
                                                      primary: HexColor("#24A0ED"),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12.0)
                                                      )
                                                    ),
                                                    onPressed: () {
                                                      //fungsi simpan
                                                      this.onClickSaveImageKTP();
                                                      Navigator.pop(context, 'Simpan');
                                                    },
                                                    child: CustomText("Simpan", 15.0, false)
                                                  ),
                                                ),
                                                SizedBox(width: 20.0,),
                                                Container(
                                                  width: 100,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      elevation: 10.0,
                                                      primary: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12.0)
                                                      )
                                                    ),
                                                    onPressed: () {
                                                      //fungsi batal
                                                      Navigator.pop(context, 'Batal');
                                                    },
                                                    child: Text(
                                                      "Batal",
                                                      style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.black,
                                                        fontFamily: 'Comfortaa'
                                                      ),
                                                    )
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              );
                            },
                            child: Image.file(
                              File(this.ktp.path),
                              width: 138,
                              height: 85,
                            )
                          )
                          : InkWell(
                            onTap: () {
                              print('unggah KTP');
                              this.uploadImageKTP();
                            },
                            child: DottedBorder(
                              color: Colors.white.withOpacity(0.5),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.0),
                              padding: EdgeInsets.all(10.0),
                              dashPattern: [10, 10,],
                              child: Container(
                                width: 138,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 48.0,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 10.0,),
                                    CustomText("Unggah", 15.0, true)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          CustomText("KTP", 15.0, false)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Container(
                  width: 170,
                  child: Card(
                    color: HexColor("#F8B50F"),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          this.ktpPasangan.path != '' ? InkWell(
                              onTap: () {
                                print("image clicked");

                                this.setPopUpImageKTPPasangan();

                                showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (context, StateSetter setState) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(19.0)
                                              ),
                                            ),
                                            elevation: 5.0,
                                            title: Column(
                                              children: [
                                                CustomText("KTP Pasangan", 15.0, false),
                                                SizedBox(height: 10),
                                                this.temp.path == "" ?
                                                CustomText("Gambar Belum Di-upload", 15.0, true)
                                                    : Image.file(
                                                  File(this.temp.path),
                                                  width: 315,
                                                  height: 200,
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#F8B50F"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi unggah
                                                        this.onClickUploadImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.arrow_circle_up,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Unggah", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#FF0000"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi hapus
                                                        this.onClickDeleteImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Hapus", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: HexColor("#24A0ED"),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi simpan
                                                            this.onClickSaveImageKTPPasangan();
                                                            Navigator.pop(context, 'Simpan');
                                                          },
                                                          child: CustomText("Simpan", 15.0, false)
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.0,),
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi batal
                                                            Navigator.pop(context, 'Batal');
                                                          },
                                                          child: Text(
                                                            "Batal",
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Colors.black,
                                                                fontFamily: 'Comfortaa'
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                );
                              },
                              child: Image.file(
                                File(this.ktpPasangan.path),
                                width: 138,
                                height: 85,
                              )
                          )
                          : InkWell(
                            onTap: () {
                              print('unggah KTP Pasangan');
                              this.uploadImageKTPPasangan();
                            },
                            child: DottedBorder(
                              color: Colors.white.withOpacity(0.5),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.0),
                              padding: EdgeInsets.all(10.0),
                              dashPattern: [10, 10,],
                              child: Container(
                                width: 138,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 48.0,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 10.0,),
                                    CustomText("Unggah", 15.0, true)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          CustomText("KTP Pasangan", 15.0, false)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 170,
                  child: Card(
                    color: HexColor("#F8B50F"),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          this.kk.path != '' ? InkWell(
                              onTap: () {
                                print("image clicked");

                                this.setPopUpImageKartuKeluarga();

                                showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (context, StateSetter setState) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(19.0)
                                              ),
                                            ),
                                            elevation: 5.0,
                                            title: Column(
                                              children: [
                                                CustomText("Kartu Keluarga", 15.0, false),
                                                SizedBox(height: 10),
                                                this.temp.path == "" ?
                                                CustomText("Gambar Belum Di-upload", 15.0, true)
                                                    : Image.file(
                                                  File(this.temp.path),
                                                  width: 315,
                                                  height: 200,
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#F8B50F"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi unggah
                                                        this.onClickUploadImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.arrow_circle_up,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Unggah", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#FF0000"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi hapus
                                                        this.onClickDeleteImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Hapus", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: HexColor("#24A0ED"),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi simpan
                                                            this.onClickSaveImageKartuKeluarga();
                                                            Navigator.pop(context, 'Simpan');
                                                          },
                                                          child: CustomText("Simpan", 15.0, false)
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.0,),
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi batal
                                                            Navigator.pop(context, 'Batal');
                                                          },
                                                          child: Text(
                                                            "Batal",
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Colors.black,
                                                                fontFamily: 'Comfortaa'
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                );
                              },
                              child: Image.file(
                                File(this.kk.path),
                                width: 138,
                                height: 85,
                              )
                          )
                          : InkWell(
                            onTap: () {
                              print('unggah Kartu Keluarga');
                              this.uploadImageKartuKeluarga();
                            },
                            child: DottedBorder(
                              color: Colors.white.withOpacity(0.5),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.0),
                              padding: EdgeInsets.all(10.0),
                              dashPattern: [10, 10,],
                              child: Container(
                                width: 138,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 48.0,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 10.0,),
                                    CustomText("Unggah", 15.0, true)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          CustomText("Kartu Keluarga", 15.0, false)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Container(
                  width: 170,
                  child: Card(
                    color: HexColor("#F8B50F"),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          this.slipGaji1.path != '' ? InkWell(
                              onTap: () {
                                print("image clicked");

                                this.setPopUpImageSlipGaji1();

                                showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (context, StateSetter setState) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(19.0)
                                              ),
                                            ),
                                            elevation: 5.0,
                                            title: Column(
                                              children: [
                                                CustomText("Slip Gaji #1", 15.0, false),
                                                SizedBox(height: 10),
                                                this.temp.path == "" ?
                                                CustomText("Gambar Belum Di-upload", 15.0, true)
                                                    : Image.file(
                                                  File(this.temp.path),
                                                  width: 315,
                                                  height: 200,
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#F8B50F"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi unggah
                                                        this.onClickUploadImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.arrow_circle_up,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Unggah", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#FF0000"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi hapus
                                                        this.onClickDeleteImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Hapus", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: HexColor("#24A0ED"),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi simpan
                                                            this.onClickSaveImageSlipGaji1();
                                                            Navigator.pop(context, 'Simpan');
                                                          },
                                                          child: CustomText("Simpan", 15.0, false)
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.0,),
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi batal
                                                            Navigator.pop(context, 'Batal');
                                                          },
                                                          child: Text(
                                                            "Batal",
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Colors.black,
                                                                fontFamily: 'Comfortaa'
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                );
                              },
                              child: Image.file(
                                File(this.slipGaji1.path),
                                width: 138,
                                height: 85,
                              )
                          )
                          : InkWell(
                            onTap: () {
                              print('unggah KTP');
                              this.uploadImageSlipGaji1();
                            },
                            child: DottedBorder(
                              color: Colors.white.withOpacity(0.5),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.0),
                              padding: EdgeInsets.all(10.0),
                              dashPattern: [10, 10,],
                              child: Container(
                                width: 138,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 48.0,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 10.0,),
                                    CustomText("Unggah", 15.0, true)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          CustomText("Slip Gaji #1", 15.0, false)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 170,
                  child: Card(
                    color: HexColor("#F8B50F"),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          this.slipGaji2.path != '' ? InkWell(
                              onTap: () {
                                print("image clicked");

                                this.setPopUpImageSlipGaji2();

                                showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (context, StateSetter setState) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(19.0)
                                              ),
                                            ),
                                            elevation: 5.0,
                                            title: Column(
                                              children: [
                                                CustomText("Slip Gaji #2", 15.0, false),
                                                SizedBox(height: 10),
                                                this.temp.path == "" ?
                                                CustomText("Gambar Belum Di-upload", 15.0, true)
                                                    : Image.file(
                                                  File(this.temp.path),
                                                  width: 315,
                                                  height: 200,
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#F8B50F"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi unggah
                                                        this.onClickUploadImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.arrow_circle_up,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Unggah", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#FF0000"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi hapus
                                                        this.onClickDeleteImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Hapus", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: HexColor("#24A0ED"),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi simpan
                                                            this.onClickSaveImageSlipGaji2();
                                                            Navigator.pop(context, 'Simpan');
                                                          },
                                                          child: CustomText("Simpan", 15.0, false)
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.0,),
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi batal
                                                            Navigator.pop(context, 'Batal');
                                                          },
                                                          child: Text(
                                                            "Batal",
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Colors.black,
                                                                fontFamily: 'Comfortaa'
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                );
                              },
                              child: Image.file(
                                File(this.slipGaji2.path),
                                width: 138,
                                height: 85,
                              )
                          )
                          : InkWell(
                            onTap: () {
                              print('unggah Slip Gaji #2');
                              this.uploadImageSlipGaji2();
                            },
                            child: DottedBorder(
                              color: Colors.white.withOpacity(0.5),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.0),
                              padding: EdgeInsets.all(10.0),
                              dashPattern: [10, 10,],
                              child: Container(
                                width: 138,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 48.0,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 10.0,),
                                    CustomText("Unggah", 15.0, true)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          CustomText("Slip Gaji #2", 15.0, false)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Container(
                  width: 170,
                  child: Card(
                    color: HexColor("#F8B50F"),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          this.slipGaji3.path != '' ? InkWell(
                              onTap: () {
                                print("image clicked");

                                this.setPopUpImageSlipGaji3();

                                showDialog<String>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (context, StateSetter setState) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(19.0)
                                              ),
                                            ),
                                            elevation: 5.0,
                                            title: Column(
                                              children: [
                                                CustomText("Slip Gaji #3", 15.0, false),
                                                SizedBox(height: 10),
                                                this.temp.path == "" ?
                                                CustomText("Gambar Belum Di-upload", 15.0, true)
                                                    : Image.file(
                                                  File(this.temp.path),
                                                  width: 315,
                                                  height: 200,
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#F8B50F"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi unggah
                                                        this.onClickUploadImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.arrow_circle_up,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Unggah", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Container(
                                                  width: 186,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          elevation: 10.0,
                                                          primary: HexColor("#FF0000"),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12.0)
                                                          )
                                                      ),
                                                      onPressed: () {
                                                        //fungsi hapus
                                                        this.onClickDeleteImage(setState);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.delete,
                                                            size: 32.0,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(width: 5.0,),
                                                          CustomText("Hapus", 15.0, false)
                                                        ],
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 20.0,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: HexColor("#24A0ED"),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi simpan
                                                            this.onClickSaveImageSlipGaji3();
                                                            Navigator.pop(context, 'Simpan');
                                                          },
                                                          child: CustomText("Simpan", 15.0, false)
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.0,),
                                                    Container(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 10.0,
                                                              primary: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(12.0)
                                                              )
                                                          ),
                                                          onPressed: () {
                                                            //fungsi batal
                                                            Navigator.pop(context, 'Batal');
                                                          },
                                                          child: Text(
                                                            "Batal",
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Colors.black,
                                                                fontFamily: 'Comfortaa'
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                );
                              },
                              child: Image.file(
                                File(this.slipGaji3.path),
                                width: 138,
                                height: 85,
                              )
                          )
                          : InkWell(
                            onTap: () {
                              print('unggah Slip Gaji #3');
                              this.uploadImageSlipGaji3();
                            },
                            child: DottedBorder(
                              color: Colors.white.withOpacity(0.5),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10.0),
                              padding: EdgeInsets.all(10.0),
                              dashPattern: [10, 10,],
                              child: Container(
                                width: 138,
                                height: 85,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_circle_up,
                                      size: 48.0,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    SizedBox(height: 10.0,),
                                    CustomText("Unggah", 15.0, true)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          CustomText("Slip Gaji #3", 15.0, false)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          Container(
            height: 57,
            child: ElevatedButton(
              onPressed: (){
                this.saveAllImage();
                print(
                    "ktp : ${this.pembiayaan.ktpFile.path}\n"
                        "ktp pasangan : ${this.pembiayaan.ktpPasanganFile.path}\n"
                        "kk : ${this.pembiayaan.kartuKeluargaFile.path}\n"
                        "slip gaji #1 : ${this.pembiayaan.slipGaji1File.path}\n"
                        "slip gaji #2 : ${this.pembiayaan.slipGaji2File.path}\n"
                        "slip gaji #3 : ${this.pembiayaan.slipGaji3File.path}\n"
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
                mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: 20.0,),
          Container(
            height: 57,
            child: ElevatedButton(
              onPressed: (){
                this.saveAllImage();

                if(this.formKeyScreen1.currentState!.validate() &&
                    this.formKeyScreen2.currentState!.validate() &&
                    this.isAllImageUploaded()){
                  print(
                      "peruntukkan 1 : ${this.pembiayaan.peruntukkan1}\n"
                          "peruntukkan 2 : ${this.pembiayaan.peruntukkan2}\n"
                          "jenis akad : ${this.pembiayaan.jenisAkad}\n"
                          "pemindahan hak : ${this.pembiayaan.pemindahanHak}\n"
                          "vendor : ${this.pembiayaan.vendor}\n"
                          "rek pihak ketiga : ${this.pembiayaan.rekPihakKetiga}\n"
                          "analytic acc : ${this.pembiayaan.analyticAcc}\n"
                          "tanggal akad : ${this.pembiayaan.tanggalAkad}\n"
                          "nilai PPA : ${this.pembiayaan.nilaiPPA}\n"
                          "harga jual : ${this.pembiayaan.hargaJual}\n"
                          "angsuran : ${this.pembiayaan.angsuran}\n"
                          "thp gaji terakhir : ${this.pembiayaan.tHPGajiTerakhir}\n"
                          "cash ratio : ${this.pembiayaan.cashRatio}\n"
                          "ktp : ${this.pembiayaan.ktpFile.path}\n"
                          "ktp pasangan : ${this.pembiayaan.ktpPasanganFile.path}\n"
                          "kk : ${this.pembiayaan.kartuKeluargaFile.path}\n"
                          "slip gaji #1 : ${this.pembiayaan.slipGaji1File.path}\n"
                          "slip gaji #2 : ${this.pembiayaan.slipGaji2File.path}\n"
                          "slip gaji #3 : ${this.pembiayaan.slipGaji3File.path}\n"
                  );
                  showDialog<String>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) =>
                          ConfirmationDialog(context, this.pembiayaan)
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      FailedInformation(context, "Data masih belum terisi semua, silakan periksa kembali")
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: HexColor("#F8B50F"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.all(5.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AJUKAN",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                  SizedBox(width: 5.0,),
                  Icon(
                    Icons.check_rounded,
                    size: 32.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}