import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/widgets/CustomText.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  late bool _passwordVisible;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordVisible = false;
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
            onFieldSubmitted: (String value) async {
              if (_formKey.currentState!.validate()) {
              }
            },
          ),
          SizedBox(height: 30.0,),
          Container(
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