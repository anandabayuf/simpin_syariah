import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/login/widgets/ButtonText.dart';
import 'package:project_simpin_syariah/views/login/widgets/ContainerImage.dart';
import 'package:project_simpin_syariah/views/login/widgets/CustomText.dart';
import 'package:project_simpin_syariah/views/login/widgets/FormLogin.dart';

class LoginScreen extends StatelessWidget {
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
                  SizedBox(height: 10.0,),
                  ContainerImage(),
                  SizedBox(height: 30.0,),
                  Container(
                    width: screenSize.width,
                    child: CustomText('Login', 32.0, false),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    width: screenSize.width,
                    child: CustomText('Halo, selamat datang kembali', 20.0, true),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    width: screenSize.width,
                    child: FormLogin()
                  ),
                  SizedBox(height: 30.0,),
                  ButtonText('Lupa password?', ''),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText('Belum memiliki akun?', 15.0, true),
                      SizedBox(width: 8.0,),
                      ButtonText('Registrasi', '')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}