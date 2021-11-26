import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';
import 'package:project_simpin_syariah/views/customwidgets/SuccessInformation.dart';

class FormUbahPassword extends StatefulWidget {
  @override
  _FormUbahPasswordState createState() => _FormUbahPasswordState();
}

class _FormUbahPasswordState extends State<FormUbahPassword> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _oldPass;
  late TextEditingController _newPass;
  late TextEditingController _newPassConf;
  late bool _oldPassVisible;
  late bool _newPassVisible;
  late bool _newPassConfVisible;
  late bool _isButtonClicked;

  @override
  void initState() {
    _oldPass = TextEditingController();
    _newPass = TextEditingController();
    _newPassConf = TextEditingController();
    _oldPassVisible = false;
    _newPassVisible = false;
    _newPassConfVisible = false;
    this._isButtonClicked = false;
    super.initState();
  }

  @override
  void dispose() {
    _oldPass.dispose();
    _newPass.dispose();
    _newPassConf.dispose();
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
              child: CustomText('Password Lama', 15.0, false)
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            controller: _oldPass,
            obscureText: !_oldPassVisible,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan password lama anda',
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
              suffixIcon: IconButton(
                icon: Icon(
                  _oldPassVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white.withOpacity(0.5),
                ),
                onPressed: () {
                  setState(() {
                    _oldPassVisible = !_oldPassVisible;
                  });
                },
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'password harus diisi';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Password Baru', 15.0, false)
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            controller: _newPass,
            obscureText: !_newPassVisible,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan password baru anda',
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
              suffixIcon: IconButton(
                icon: Icon(
                  _newPassVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white.withOpacity(0.5),
                ),
                onPressed: () {
                  setState(() {
                    _newPassVisible = !_newPassVisible;
                  });
                },
              ),
            ),
            validator: (String? value) {
              if (value == '' || value!.trim() == '') {
                return 'password harus diisi';
              } else if(value.length < 8) {
                return 'password minimal harus terdiri dari 8 karakter';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0,),
          Container(
              width: screenSize.width,
              child: CustomText('Konfirmasi Password Baru', 15.0, false)
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            controller: _newPassConf,
            obscureText: !_newPassConfVisible,
            textInputAction: TextInputAction.done,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan kembali password anda',
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
              suffixIcon: IconButton(
                icon: Icon(
                  _newPassConfVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white.withOpacity(0.5),
                ),
                onPressed: () {
                  setState(() {
                    _newPassConfVisible = !_newPassConfVisible;
                  });
                },
              ),
            ),
            validator: (String? value) {
              if (value != this._newPass.text) {
                return 'password tidak sama';
              }
              return null;
            },
          ),
          SizedBox(height: 50.0,),
          if (_isButtonClicked) CircularProgressIndicator(
            color: HexColor('#F8B50F'),
          ) else Container(
            width: screenSize.width,
            height: 39,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                        fontSize: 15.0
                    ),
                    elevation: 10,
                    primary: HexColor("#F8B50F"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)
                    )
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      this._isButtonClicked = true;
                    });

                    Future.delayed(
                      Duration(
                          seconds: 3
                      ),
                      (){
                        //pengecekan password

                        //jika password lama sesuai && password baru tidak sama dengan password lama maka,
                        if (_oldPass.text == "12345678" && _newPass.text != "12345678") {
                          setState(() {
                            _oldPassVisible = false;
                            _newPassVisible = false;
                            _newPassConfVisible = false;

                            this._isButtonClicked = false;

                            this._oldPass.clear();
                            this._newPass.clear();
                            this._newPassConf.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SuccessInformation(context, 'Password berhasil diubah')
                          );
                        }
                        //jika password lama tidak sesuai
                        else if(this._oldPass.text != "12345678") {
                          setState(() {
                            this._isButtonClicked = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              FailedInformation(context, 'Password lama salah!')
                          );
                        }
                        //jika password baru masih sama seperti password lama
                        else if(this._newPass.text == "12345678"){
                          setState(() {
                            this._isButtonClicked = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              FailedInformation(context, 'Password baru harus berbeda dari password sebelumnya')
                          );
                        }
                      }
                    );
                  }
                },
                child: CustomText('UBAH PASSWORD', 15.0, false)
            ),
          ),
        ],
      ),
    );
  }
}