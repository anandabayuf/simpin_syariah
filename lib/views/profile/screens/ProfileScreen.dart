import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonText.dart';
import 'package:project_simpin_syariah/views/customwidgets/ProfileButton.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
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
                    child: ProfileButton(),
                    alignment: Alignment.centerRight,
                  ),
                  Card(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/appbar/ava-mock.png'),
                      radius: 100.0,
                      backgroundColor: Colors.transparent,
                    ),
                    color: Colors.transparent,
                    elevation: 18.0,
                    shape: CircleBorder(),
                  ),
                  ButtonText('Ubah Foto Profile', ''),
                  SizedBox(height: 10.0,),
                  SizedBox(
                    width: 400,
                    height: 300,
                    child: Stack(
                      children: [
                        Container(
                          width: 349,
                          height: 260,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.white.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: -10,
                          child: Card(
                            color: Colors.transparent,
                            elevation: 18.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: HexColor('#F8B50F'),
                              radius: 30.0,
                              child: IconButton(
                                onPressed: (){
                                  print('clicked');
                                },
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 32.0,
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}