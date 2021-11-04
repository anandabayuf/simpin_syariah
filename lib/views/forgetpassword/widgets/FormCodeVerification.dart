import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/widgets/CustomText.dart';
import 'package:project_simpin_syariah/views/widgets/FailedInformation.dart';

class FormCodeVerification extends StatefulWidget {
  @override
  _FormCodeVerificationState createState() => _FormCodeVerificationState();
}

class _FormCodeVerificationState extends State<FormCodeVerification> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstDigit;
  late TextEditingController _secondDigit;
  late TextEditingController _thirdDigit;
  late TextEditingController _fourthDigit;
  late String code;
  late bool _isButtonDisabled;
  late bool _isButtonClicked;
  final String staticCode = "1234";

  @override
  void initState() {
    _firstDigit = TextEditingController();
    _secondDigit = TextEditingController();
    _thirdDigit = TextEditingController();
    _fourthDigit = TextEditingController();
    this._isButtonDisabled = true;
    _isButtonClicked = false;
    super.initState();
  }

  @override
  void dispose() {
    _firstDigit.dispose();
    _secondDigit.dispose();
    _thirdDigit.dispose();
    _fourthDigit.dispose();
    super.dispose();
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
              Container(
                width: 50,
                child: TextFormField(
                  controller: _firstDigit,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
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
                      counterText: ''
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String value) {
                    if(value!=''){
                      FocusScope.of(context).nextFocus();
                    }

                    this.code = _firstDigit.text + _secondDigit.text +
                        _thirdDigit.text + _fourthDigit.text;
                    if(this.code.length == 4){
                      setState(() {
                        this._isButtonDisabled = false;
                      });
                    } else {
                      setState(() {
                        this._isButtonDisabled = true;
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: 50,
                child: TextFormField(
                  controller: _secondDigit,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
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
                      counterText: ''
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String value) {
                    if(value!=''){
                      FocusScope.of(context).nextFocus();
                    } else {
                      FocusScope.of(context).previousFocus();
                    }

                    this.code = _firstDigit.text + _secondDigit.text +
                        _thirdDigit.text + _fourthDigit.text;
                    if(this.code.length == 4){
                      setState(() {
                        this._isButtonDisabled = false;
                      });
                    } else {
                      setState(() {
                        this._isButtonDisabled = true;
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: 50,
                child: TextFormField(
                  controller: _thirdDigit,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
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
                      counterText: ''
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String value) {
                    if(value!=''){
                      FocusScope.of(context).nextFocus();
                    } else {
                      FocusScope.of(context).previousFocus();
                    }

                    this.code = _firstDigit.text + _secondDigit.text +
                        _thirdDigit.text + _fourthDigit.text;
                    if(this.code.length == 4){
                      setState(() {
                        this._isButtonDisabled = false;
                      });
                    } else {
                      setState(() {
                        this._isButtonDisabled = true;
                      });
                    }
                  },
                ),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: 50,
                child: TextFormField(
                  controller: _fourthDigit,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      focusColor: Colors.white,
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
                      counterText: ''
                  ),
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onChanged: (String value) {
                    if(value==''){
                      FocusScope.of(context).previousFocus();
                    }

                    this.code = _firstDigit.text + _secondDigit.text +
                        _thirdDigit.text + _fourthDigit.text;
                    if(this.code.length == 4){
                      setState(() {
                        this._isButtonDisabled = false;
                      });
                    } else {
                      setState(() {
                        this._isButtonDisabled = true;
                      });
                    }
                  },
                  onFieldSubmitted: (String value) {
                    code = _firstDigit.text + _secondDigit.text + _thirdDigit.text +
                      _fourthDigit.text;
                    print(code);

                    setState(() {
                      this._isButtonClicked = true;
                    });

                    //check code
                    Future.delayed(
                        Duration(
                            seconds: 3
                        ),
                        (){
                          setState(() {
                            this._isButtonClicked = false;
                          });
                          if(this.code == this.staticCode){
                            Navigator.of(context).pushReplacementNamed(
                                '/buat-password-baru'
                            );
                          } else {
                            Scaffold.of(context).showSnackBar(
                              FailedInformation(context, 'Maaf kode yang anda masukkan tidak sesuai')
                            );
                          }
                        }
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 50.0,),
          _isButtonClicked ?  CircularProgressIndicator(
            color: HexColor('#F8B50F'),
          ) : Container(
            width: 244,
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
              onPressed: this._isButtonDisabled ? null : () {
                code = _firstDigit.text + _secondDigit.text + _thirdDigit.text +
                    _fourthDigit.text;
                print(code);

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
                    if(this.code == this.staticCode){
                      Navigator.of(context).pushReplacementNamed(
                          '/buat-password-baru'
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                          FailedInformation(context, 'Maaf kode yang anda masukkan tidak sesuai')
                      );
                    }
                  }
                );
              },
              child: CustomText('Verifikasi', 15.0, false)
            ),
          ),
        ],
      )
    );
  }
}