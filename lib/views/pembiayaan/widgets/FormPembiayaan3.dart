import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';
import 'package:project_simpin_syariah/views/pembiayaan/widgets/ConfirmationDialog.dart';
import 'package:project_simpin_syariah/views/customwidgets/UploadContainer.dart';
import 'package:project_simpin_syariah/views/customwidgets/UploadPicker.dart';
import 'package:project_simpin_syariah/views/customwidgets/UploadPickerWithState.dart';
import 'package:project_simpin_syariah/views/customwidgets/ViewImageDialog.dart';

class FormPembiayaan3 extends StatefulWidget {
  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;
  final GlobalKey<ScaffoldState> scaffoldKey;

  FormPembiayaan3({Key? key, required this.scaffoldKey, required this.pembiayaan, required this.formKeyScreen1,
    required this.formKeyScreen2}) : super(key: key);

  @override
  _FormPembiayaan3State createState() => _FormPembiayaan3State(scaffoldKey, pembiayaan, this.formKeyScreen1, this.formKeyScreen2);
}

class _FormPembiayaan3State extends State<FormPembiayaan3> {
  final _formKey = GlobalKey<FormState>();

  final Pembiayaan pembiayaan;
  final GlobalKey<FormState> formKeyScreen1;
  final GlobalKey<FormState> formKeyScreen2;
  final GlobalKey<ScaffoldState> scaffoldKey;

  late XFile ktp;
  late XFile ktpPasangan;
  late XFile kk;
  late XFile slipGaji1;
  late XFile slipGaji2;
  late XFile slipGaji3;

  final ImagePicker _picker = ImagePicker();

  _FormPembiayaan3State(this.scaffoldKey, this.pembiayaan, this.formKeyScreen1, this.formKeyScreen2);

  @override
  void initState() {
    this.ktp = this.pembiayaan.ktpFile;
    this.ktpPasangan = this.pembiayaan.ktpPasanganFile;
    this.kk = this.pembiayaan.kartuKeluargaFile;
    this.slipGaji1 = this.pembiayaan.slipGaji1File;
    this.slipGaji2 = this.pembiayaan.slipGaji2File;
    this.slipGaji3 = this.pembiayaan.slipGaji3File;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> getImageFromCamera() async {
    // Pick an image
    XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File? imageCropped;
    if(image!= null){
      imageCropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        maxWidth: 1080,
        maxHeight: 1080,
      );
      if(imageCropped != null){
        return imageCropped.path;
      }
      return null;
    }
    return null;
  }

  Future<String?> getImageFromGallery() async {
    // Pick an image
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File? imageCropped;
    if(image!= null){
      imageCropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        maxWidth: 1080,
        maxHeight: 1080,
      );
      if(imageCropped != null){
        return imageCropped.path;
      }
      return null;
    }
    return null;
  }

  void getKTPFromCamera() {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.ktp = XFile(value);
        });
      }
    });
  }

  void getKTPFromGallery(){
    this.getImageFromGallery().then((value){
     if(value != null){
       setState(() {
         this.ktp = XFile(value);
       });
     }
    });
  }

  void uploadImageKTP() {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerContext) {
        return UploadPicker(uploadPickerContext, this.getKTPFromGallery,
            this.getKTPFromCamera);
      },
    );
  }

  void getKTPPasanganFromCamera() {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.ktpPasangan = XFile(value);
        });
      }
    });
  }

  void getKTPPasanganFromGallery()  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.ktpPasangan = XFile(value);
        });
      }
    });
  }

  void uploadImageKTPPasangan() {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerContext) {
        return UploadPicker(uploadPickerContext, this.getKTPPasanganFromGallery,
            this.getKTPPasanganFromCamera);
      },
    );
  }

  void getKKFromCamera() {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.kk = XFile(value);
        });
      }
    });
  }

  void getKKFromGallery() {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.kk = XFile(value);
        });
      }
    });
  }

  void uploadImageKartuKeluarga() {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerContext) {
        return UploadPicker(uploadPickerContext, this.getKKFromGallery,
            this.getKKFromCamera);
      },
    );
  }

  void getSlipGaji1FromCamera() {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.slipGaji1 = XFile(value);
        });
      }
    });
  }

  void getSlipGaji1FromGallery()  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.slipGaji1 = XFile(value);
        });
      }
    });
  }

  void uploadImageSlipGaji1() {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerContext) {
        return UploadPicker(uploadPickerContext, this.getSlipGaji1FromGallery,
            this.getSlipGaji1FromCamera);
      },
    );
  }

  void getSlipGaji2FromCamera()  {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.slipGaji2 = XFile(value);
        });
      }
    });
  }

  void getSlipGaji2FromGallery()  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.slipGaji2 = XFile(value);
        });
      }
    });
  }

  void uploadImageSlipGaji2() {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerContext) {
        return UploadPicker(uploadPickerContext, this.getSlipGaji2FromGallery,
            this.getSlipGaji2FromCamera);
      },
    );
  }

  void getSlipGaji3FromCamera()  {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.slipGaji3 = XFile(value);
        });
      }
    });
  }

  void getSlipGaji3FromGallery()  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.slipGaji3 = XFile(value);
        });
      }
    });
  }

  void uploadImageSlipGaji3() async {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerContext) {
        return UploadPicker(uploadPickerContext, this.getSlipGaji3FromGallery,
            this.getSlipGaji3FromCamera);
      },
    );
  }

  void getKTPFromCameraPopUp(setState) {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.ktp = XFile(value);
        });

        saveImageKTP(this.ktp);
      }
    });
  }

  void getKTPFromGalleryPopUp(setState) {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.ktp = XFile(value);
        });

        saveImageKTP(this.ktp);
      }
    });
  }

  void uploadImageKTPPopUp(setState) {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerPopUpContext) {
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getKTPFromGalleryPopUp,
        this.getKTPFromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageKTP(setState){
    setState(() {
      this.ktp = XFile('');
    });
    saveImageKTP(XFile(''));
  }

  void saveImageKTP(XFile image){
    setState(() {
      this.ktp = image;
    });
  }

  void getKTPPasanganFromCameraPopUp(setState) {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.ktpPasangan = XFile(value);
        });

        saveImageKTPPasangan(this.ktpPasangan);
      }
    });
  }

  void getKTPPasanganFromGalleryPopUp(setState) {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.ktpPasangan = XFile(value);
        });

        saveImageKTPPasangan(this.ktpPasangan);
      }
    });
  }

  void uploadImageKTPPasanganPopUp(setState) {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerPopUpContext) {
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getKTPPasanganFromGalleryPopUp,
            this.getKTPPasanganFromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageKTPPasangan(setState){
    setState(() {
      this.ktpPasangan = XFile('');
    });
    saveImageKTPPasangan(XFile(''));
  }

  void saveImageKTPPasangan(XFile image){
    setState(() {
      this.ktpPasangan = image;
    });
  }

  void getKKFromCameraPopUp(setState)  {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.kk = XFile(value);
        });

        saveImageKartuKeluarga(this.kk);
      }
    });
  }

  void getKKFromGalleryPopUp(setState)  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.kk = XFile(value);
        });

        saveImageKartuKeluarga(this.kk);
      }
    });
  }

  void uploadImageKartuKeluargaPopUp(setState)  {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerPopUpContext) {
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getKKFromGalleryPopUp,
            this.getKKFromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageKK(setState){
    setState(() {
      this.kk = XFile('');
    });
    saveImageKartuKeluarga(XFile(''));
  }

  void saveImageKartuKeluarga(XFile image){
    setState(() {
      this.kk = image;
    });
  }

  void getSlipGaji1FromCameraPopUp(setState)  {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.slipGaji1 = XFile(value);
        });

        saveImageSlipGaji1(this.slipGaji1);
      }
    });
  }

  void getSlipGaji1FromGalleryPopUp(setState)  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.slipGaji1 = XFile(value);
        });

        saveImageSlipGaji1(this.slipGaji1);
      }
    });
  }

  void uploadImageSlipGaji1PopUp(setState)  {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerPopUpContext) {
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getSlipGaji1FromGalleryPopUp,
            this.getSlipGaji1FromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageSlipGaji1(setState){
    setState(() {
      this.slipGaji1 = XFile('');
    });
    saveImageSlipGaji1(XFile(''));
  }

  void saveImageSlipGaji1(XFile image){
    setState(() {
      this.slipGaji1 = image;
    });
  }

  void getSlipGaji2FromCameraPopUp(setState)  {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.slipGaji2 = XFile(value);
        });

        saveImageSlipGaji2(this.slipGaji2);
      }
    });
  }

  void getSlipGaji2FromGalleryPopUp(setState)  {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.slipGaji2 = XFile(value);
        });

        saveImageSlipGaji2(this.slipGaji2);
      }
    });
  }

  void uploadImageSlipGaji2PopUp(setState)  {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerPopUpContext) {
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getSlipGaji2FromGalleryPopUp,
            this.getSlipGaji2FromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageSlipGaji2(setState){
    setState(() {
      this.slipGaji2 = XFile('');
    });
    saveImageSlipGaji2(XFile(''));
  }

  void saveImageSlipGaji2(XFile image){
    setState(() {
      this.slipGaji2 = image;
    });
  }

  void getSlipGaji3FromCameraPopUp(setState)  {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.slipGaji3 = XFile(value);
        });

        saveImageSlipGaji3(this.slipGaji3);
      }
    });
  }

  void getSlipGaji3FromGalleryPopUp(setState) {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.slipGaji3 = XFile(value);
        });

        saveImageSlipGaji3(this.slipGaji3);
      }
    });
  }

  void uploadImageSlipGaji3PopUp(setState) {
    showModalBottomSheet<void>(
      context: context,
      elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: HexColor("#50AEA7"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
      ),
      builder: (BuildContext uploadPickerPopUpContext) {
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getSlipGaji3FromGalleryPopUp,
            this.getSlipGaji3FromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageSlipGaji3(setState){
    setState(() {
      this.slipGaji3 = XFile('');
    });
    saveImageSlipGaji3(XFile(''));
  }

  void saveImageSlipGaji3(XFile image){
    setState(() {
      this.slipGaji3 = image;
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
                                showDialog<String>(
                                    context: scaffoldKey.currentContext!,
                                    builder: (BuildContext showImageDialogContext) {
                                      return StatefulBuilder(
                                        builder: (BuildContext showImageDialogContext, StateSetter setState) {
                                          return ViewImageDialog(showImageDialogContext, setState, "KTP", this.ktp,
                                          this.uploadImageKTPPopUp, this.onClickDeleteImageKTP);
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
                          : UploadContainer(this.uploadImageKTP),
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
                                showDialog<String>(
                                    context: scaffoldKey.currentContext!,
                                    builder: (BuildContext showImageDialogContext) {
                                      return StatefulBuilder(
                                        builder: (showImageDialogContext, StateSetter setState) {
                                          return ViewImageDialog(showImageDialogContext, setState, "KTP Pasangan", this.ktpPasangan,
                                              this.uploadImageKTPPasanganPopUp, this.onClickDeleteImageKTPPasangan);
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
                              : UploadContainer(this.uploadImageKTPPasangan),
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
                                showDialog<String>(
                                    context: scaffoldKey.currentContext!,
                                    builder: (BuildContext showImageDialogContext) {
                                      return StatefulBuilder(
                                        builder: (showImageDialogContext, StateSetter setState) {
                                          return ViewImageDialog(showImageDialogContext, setState, "Kartu Keluarga", this.kk,
                                              this.uploadImageKartuKeluargaPopUp,
                                              this.onClickDeleteImageKK);
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
                          : UploadContainer(this.uploadImageKartuKeluarga),
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
                                showDialog<String>(
                                    context: scaffoldKey.currentContext!,
                                    builder: (BuildContext showImageDialogContext) {
                                      return StatefulBuilder(
                                        builder: (showImageDialogContext, StateSetter setState) {
                                          return ViewImageDialog(showImageDialogContext, setState, "Slip Gaji #1", this.slipGaji1,
                                              this.uploadImageSlipGaji1PopUp, this.onClickDeleteImageSlipGaji1);
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
                          : UploadContainer(this.uploadImageSlipGaji1),
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
                                showDialog<String>(
                                    context: scaffoldKey.currentContext!,
                                    builder: (BuildContext showImageDialogContext) {
                                      return StatefulBuilder(
                                        builder: (showImageDialogContext, StateSetter setState) {
                                          return ViewImageDialog(showImageDialogContext, setState, "Slip Gaji #2", this.slipGaji2,
                                              this.uploadImageSlipGaji2PopUp, this.onClickDeleteImageSlipGaji2);
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
                          : UploadContainer(this.uploadImageSlipGaji2),
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
                                showDialog<String>(
                                    context: scaffoldKey.currentContext!,
                                    builder: (BuildContext showImageDialogContext) {
                                      return StatefulBuilder(
                                        builder: (showImageDialogContext, StateSetter setState) {
                                          return ViewImageDialog(showImageDialogContext, setState, "Slip Gaji #3", this.slipGaji3,
                                              this.uploadImageSlipGaji3PopUp, this.onClickDeleteImageSlipGaji3);
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
                              : UploadContainer(this.uploadImageSlipGaji3),
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
                      context: scaffoldKey.currentContext!,
                      builder: (BuildContext showConfirmationDialogContext) =>
                          ConfirmationDialog(showConfirmationDialogContext, this.pembiayaan)
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