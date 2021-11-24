import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/profile/widgets/ContainerIconImage.dart';
import 'package:project_simpin_syariah/views/forgetpassword/widgets/FormMakeNewPass.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/profile/widgets/FormUbahPassword.dart';

class UbahPasswordScreen extends StatelessWidget {
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    ContainerIconImage('assets/images/forgetpassword/password.png'),
                    SizedBox(height: 30.0,),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenSize.width,
                      child: CustomText('Ubah Password', 32.0, false),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                        width: screenSize.width,
                        alignment: Alignment.center,
                        child: CustomText(
                          'Password baru Anda harus berbeda dari password yang digunakan sebelumnya.',
                          15.0,
                          true
                        )
                    ),
                    SizedBox(height: 30.0,),
                    FormUbahPassword(),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}