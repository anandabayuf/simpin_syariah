import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';

class FormInputEmail extends StatefulWidget {
  @override
  _FormInputEmailState createState() => _FormInputEmailState();
}

class _FormInputEmailState extends State<FormInputEmail> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late bool _isButtonClicked;
  final String staticEmail = 'john@email.com';

  @override
  void initState() {
    _email = TextEditingController();
    this._isButtonClicked = false;
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
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
            child: CustomText('Email', 15.0, false)
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            controller: _email,
            textInputAction: TextInputAction.done,
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
                return 'alamat email harus diisi';
              } else if (!value.contains('@')) {
                return 'Masukkan alamat email yang valid';
              }
              return null;
            },
            onFieldSubmitted: (String value) {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  this._isButtonClicked = true;
                });

                Future.delayed(
                  Duration(
                      seconds: 3
                  ),
                  (){
                    setState(() {
                      this._isButtonClicked = false;
                    });

                    //check code
                    if(this._email.text == this.staticEmail){
                      Navigator.of(context).pushReplacementNamed(
                          '/verifikasi-email'
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        FailedInformation(context, 'Akun dengan email tersebut belum terdaftar')
                      );
                    }
                  }
                );
              }
            },
          ),
          SizedBox(height: 50.0,),
          _isButtonClicked ?  CircularProgressIndicator(
            color: HexColor('#F8B50F'),
          ) : Container(
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
                      setState(() {
                        this._isButtonClicked = false;
                      });

                      //check code
                      if(this._email.text == this.staticEmail){
                        Navigator.of(context).pushReplacementNamed(
                            '/verifikasi-email'
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            FailedInformation(context, 'Akun dengan email tersebut belum terdaftar')
                        );
                      }
                    }
                  );
                }
              },
              child: CustomText('KIRIM KODE VERIFIKASI', 15.0, false)
            ),
          ),
        ],
      ),
    );
  }
}