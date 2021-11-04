import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/forgetpassword/widgets/ContainerIconImage.dart';
import 'package:project_simpin_syariah/views/forgetpassword/widgets/FormMakeNewPass.dart';
import 'package:project_simpin_syariah/views/widgets/CustomText.dart';

class MakeNewPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: ColorfulSafeArea(
          color: HexColor("#50AEA7"),
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            color: HexColor("#50AEA7"),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 32.0,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/lupa-password');
                        },
                      ),
                    ),
                    ContainerIconImage('assets/images/forgetpassword/password.png'),
                    SizedBox(height: 30.0,),
                    Container(
                      alignment: Alignment.center,
                      width: screenSize.width,
                      child: CustomText('Buat Password Baru', 32.0, false),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                        width: screenSize.width,
                        alignment: Alignment.center,
                        child: Text(
                          'Password baru Anda harus berbeda dari password yang digunakan sebelumnya.',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white.withOpacity(0.5),
                              fontFamily: 'Comfortaa'
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                    SizedBox(height: 30.0,),
                    FormMakeNewPass(),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}