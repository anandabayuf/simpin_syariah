import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  late bool _passwordVisible;
  late bool _isButtonClicked;
  final String staticEmail = 'john@email.com';
  final String staticPassword = '12345678';

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordVisible = false;
    _isButtonClicked = false;
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
                return 'alamat email harus diisi';
              } else if (value != null && !value.contains('@')) {
                return 'Masukkan alamat email yang valid';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0,),
          Container(
            width: screenSize.width,
            child: CustomText('Password', 15.0, false)
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            controller: _password,
            obscureText: !_passwordVisible,
            textInputAction: TextInputAction.done,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.0
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              focusColor: Colors.white,
              hintText: 'Masukkan password anda',
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
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white.withOpacity(0.5),
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
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
            onFieldSubmitted: (String value) {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isButtonClicked = true;
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
                    if(this._email.text == this.staticEmail) {
                      if(this._password.text != this.staticPassword){
                        Scaffold.of(context).showSnackBar(
                            FailedInformation(context, 'Password yang anda masukkan salah')
                        );
                      }
                    } else {
                      Scaffold.of(context).showSnackBar(
                          FailedInformation(context, 'Akun dengan email tersebut belum terdaftar')
                      );
                    }
                  }
                );
              }
            },
          ),
          SizedBox(height: 30.0,),
          _isButtonClicked ? CircularProgressIndicator(
            color: HexColor('#F8B50F'),
          ) : Container(
            width: 186,
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
                    _isButtonClicked = true;
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
                      if(this._email.text == this.staticEmail) {
                        if(this._password.text != this.staticPassword){
                          Scaffold.of(context).showSnackBar(
                              FailedInformation(context, 'Password yang anda masukkan salah')
                          );
                        }
                      } else {
                        Scaffold.of(context).showSnackBar(
                          FailedInformation(context, 'Akun dengan email tersebut belum terdaftar')
                        );
                      }
                    }
                  );
                }
              },
              child: CustomText('Login', 15.0, false)
            ),
          ),
        ],
      ),
    );
  }
}