import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/widgets/CustomText.dart';

class FormInputEmail extends StatefulWidget {
  @override
  _FormInputEmailState createState() => _FormInputEmailState();
}

class _FormInputEmailState extends State<FormInputEmail> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
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
            onFieldSubmitted: (String value) {
              if (_formKey.currentState!.validate()) {
              }
            },
          ),
          SizedBox(height: 50.0,),
          Container(
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  }
                },
                child: CustomText('Kirim Kode Verifikasi', 15.0, false)
            ),
          ),
        ],
      ),
    );
  }
}