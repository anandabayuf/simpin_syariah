import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/user/User.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/SuccessInformation.dart';
import 'package:project_simpin_syariah/views/customwidgets/UploadPicker.dart';
import 'package:project_simpin_syariah/views/customwidgets/UploadPickerWithState.dart';
import 'package:project_simpin_syariah/views/profile/widgets/EditButtonProfilePicture.dart';
import 'package:project_simpin_syariah/views/profile/widgets/PlaceholderImage.dart';
import 'package:project_simpin_syariah/views/profile/widgets/ProfileImageContainer.dart';
import 'package:project_simpin_syariah/views/profile/widgets/ViewImageProfileDialog.dart';

typedef void SetIsEditProfileValue(bool value);

class FormProfile extends StatefulWidget {
  final User user;
  final SetIsEditProfileValue isEditProfileValue;
  final GlobalKey<ScaffoldState> scaffoldKey;

  FormProfile(this.scaffoldKey, this.user, this.isEditProfileValue);

  @override
  _FormProfileState createState() => _FormProfileState(this.scaffoldKey, this.user, this.isEditProfileValue);
}

class _FormProfileState extends State<FormProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nama;
  late TextEditingController _email;
  late TextEditingController _nik;
  late MaskedTextController _noTelp;
  late bool _isButtonClicked;

  late XFile profilePict;

  final User user;
  final SetIsEditProfileValue isEditProfileValue;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final ImagePicker _picker = ImagePicker();

  _FormProfileState(this.scaffoldKey, this.user, this.isEditProfileValue);

  @override
  void initState() {
    _nama = TextEditingController(text: this.user.name);
    _email = TextEditingController(text: this.user.email);
    _nik = TextEditingController(text: this.user.nik);
    _noTelp = MaskedTextController(mask: "000-0000-0000", text: this.user.noTelp);
    _isButtonClicked = false;

    profilePict = new XFile(this.user.profileURL);
    super.initState();
  }

  @override
  void dispose() {
    _nama.dispose();
    _email.dispose();
    _nik.dispose();
    _noTelp.dispose();
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

  void getProfilePictFromCamera() {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.profilePict = XFile(value);
        });
        //this.user.profileURL = value;
      }
    });
  }

  void getProfilePictFromGallery(){
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.profilePict = XFile(value);
        });
        //this.user.profileURL = value;
      }
    });
  }

  void uploadImageProfile() {
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
        return UploadPicker(uploadPickerContext, this.getProfilePictFromGallery,
            this.getProfilePictFromCamera);
      },
    );
  }

  void getProfilePictFromCameraPopUp(setState) {
    this.getImageFromCamera().then((value){
      if(value != null){
        setState(() {
          this.profilePict = XFile(value);
        });

        saveImageProfile(this.profilePict);
      }
    });
  }

  void getProfilePictFromGalleryPopUp(setState) {
    this.getImageFromGallery().then((value){
      if(value != null){
        setState(() {
          this.profilePict = XFile(value);
        });

        saveImageProfile(this.profilePict);
      }
    });
  }

  void uploadImageProfilePopUp(setState) {
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
        return UploadPickerWithState(uploadPickerPopUpContext, setState, this.getProfilePictFromGalleryPopUp,
            this.getProfilePictFromCameraPopUp);
      },
    );
  }

  void onClickDeleteImageProfile(setState){
    setState(() {
      this.profilePict = XFile('');
    });
    saveImageProfile(XFile(''));
  }

  void saveImageProfile(XFile image){
    setState(() {
      this.profilePict = image;
    });
  }

  void onClickEditProfilePicture(){
    showDialog<String>(
        context: scaffoldKey.currentContext!,
        builder: (BuildContext showImageDialogContext) {
          return StatefulBuilder(
            builder: (BuildContext showImageDialogContext, StateSetter setState) {
              return ViewImageProfileDialog(showImageDialogContext, setState, this.profilePict,
                  this.uploadImageProfilePopUp, this.onClickDeleteImageProfile);
            },
          );
        }
    );
  }

  void _simpanData(){
    setState(() {
      this.user.name = this._nama.text;
      this.user.email = this._email.text;
      this.user.nik = this._nik.text;
      this.user.noTelp = this._noTelp.value.text;
      this.user.profileURL = this.profilePict.path;
    });

    this.scaffoldKey.currentState!.mounted;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Form(
      key: this._formKey,
      child: Column(
        children: [
          this.profilePict.path != "" ? Stack (
            children: [
              ProfileImageContainer(this.profilePict.path),
              EditButtonProfilePicture(false, this.onClickEditProfilePicture),
            ],
          ) : Stack(
            children: [
              PlaceholderImage(),
              EditButtonProfilePicture(true, this.uploadImageProfile),
            ],
          ),
          SizedBox(height: 30.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Nama', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this._nama,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan nama anda',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0
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
                return 'Nama harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Email', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this._email,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan email anda',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0
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
                return 'Nama harus diisi';
              } else if (!value.contains('@')) {
                return 'Masukkan alamat email yang valid';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Nomor Induk Kependudukan', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this._nik,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan NIK anda',
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0
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
                return 'NIK harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Nomor Telepon', 15.0, false)
          ),
          SizedBox(height: 5.0,),
          TextFormField(
            controller: this._noTelp,
            textInputAction: TextInputAction.done,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: '8XX-XXXX-XXXX',
              prefix: CustomText("+62 ", 15.0, false),
              hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 15.0
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
                return 'Nomor Telepon harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 30.0,),
          _isButtonClicked ? CircularProgressIndicator(
            color: HexColor('#24A0ED'),
          ) :
          Row(
            children: [
              Expanded(
                child: Container(
                  width: screenSize.width ,
                  height: 39,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 15.0
                          ),
                          elevation: 10,
                          primary: HexColor("#24A0ED"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isButtonClicked = true;
                          });

                          Future.delayed(
                              Duration(
                                  seconds: 3
                              ),
                              (){
                                _simpanData();
                                setState(() {
                                  this._isButtonClicked = false;
                                });
                                isEditProfileValue(false);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SuccessInformation(context, 'Data berhasil diubah')
                                );

                                //check code
                                // if(this._email.text == this.user.email) {
                                //   if(this._password.text != this.user.password){
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //         FailedInformation(context, 'Password yang anda masukkan salah')
                                //     );
                                //   } else {
                                //     Navigator.pushReplacement(
                                //         context,
                                //         MaterialPageRoute(builder: (context) => Main())
                                //     );
                                //   }
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       FailedInformation(context, 'Akun dengan email tersebut belum terdaftar')
                                //   );
                                // }
                              }
                          );
                        }
                      },
                      child: CustomText('SIMPAN', 15.0, false)
                  ),
                ),
              ),
              SizedBox(width: 10.0,),
              Expanded(
                child: Container(
                  width: screenSize.width ,
                  height: 39,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                              fontSize: 15.0
                          ),
                          elevation: 10,
                          primary: Colors.white.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)
                          )
                      ),
                      onPressed: () {
                        isEditProfileValue(false);
                      },
                      child: CustomText('BATAL', 15.0, false)
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}