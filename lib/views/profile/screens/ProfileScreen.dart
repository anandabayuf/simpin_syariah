import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/user/User.dart';
import 'package:project_simpin_syariah/views/customwidgets/BottomNav.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonText.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  final User user = User.emptyConstructor().getDummyUser();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          print("versi");
                          Navigator.of(context).pushNamed("/versi");
                        },
                        icon: Icon(
                          Icons.info_outline,
                          size: 32.0,
                          color: Colors.white,
                        )
                      ),
                      IconButton(
                          onPressed: () {
                            print("logout");
                          },
                          icon: Icon(
                            Icons.logout_rounded,
                            size: 32.0,
                            color: Colors.red,
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  this.user.profileURL != "" ? Card(
                    child:  CircleAvatar(
                      backgroundImage:
                        AssetImage(this.user.profileURL),
                      radius: 150.0,
                      backgroundColor: Colors.transparent,
                    ),
                    color: Colors.transparent,
                    elevation: 18.0,
                    shape: CircleBorder(),
                  ) : Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                    size: 300.0,
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog<String>(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, StateSetter setState) {
                                return AlertDialog(
                                  backgroundColor: Colors.white.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(19.0)
                                    ),
                                  ),
                                  elevation: 5.0,
                                  title: Column(
                                    children: [
                                      Card(
                                        child: CircleAvatar(
                                          backgroundImage: FadeInImage(
                                            placeholder: AssetImage("assets/images/appbar/ava-mock.png"),
                                            image: NetworkImage(""),
                                          ).image,
                                          radius: 150.0,
                                          backgroundColor: Colors.transparent,
                                        ),
                                        color: Colors.transparent,
                                        elevation: 18.0,
                                        shape: CircleBorder(),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        width: 186,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 10.0,
                                                primary: HexColor("#F8B50F"),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12.0)
                                                )
                                            ),
                                            onPressed: () {
                                              //fungsi unggah
                                              //this.onClickUploadImage(setState);
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.arrow_circle_up,
                                                  size: 32.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.0,),
                                                CustomText("Unggah", 15.0, false)
                                              ],
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        width: 186,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                elevation: 10.0,
                                                primary: HexColor("#FF0000"),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12.0)
                                                )
                                            ),
                                            onPressed: () {
                                              //fungsi hapus
                                              //this.onClickDeleteImage(setState);
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  size: 32.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 5.0,),
                                                CustomText("Hapus", 15.0, false)
                                              ],
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 20.0,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 10.0,
                                                    primary: HexColor("#24A0ED"),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12.0)
                                                    )
                                                ),
                                                onPressed: () {
                                                  //fungsi simpan
                                                  //this.onClickSaveImageKTP();
                                                  Navigator.pop(context, 'Simpan');
                                                },
                                                child: CustomText("Simpan", 15.0, false)
                                            ),
                                          ),
                                          SizedBox(width: 20.0,),
                                          Container(
                                            width: 100,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 10.0,
                                                    primary: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12.0)
                                                    )
                                                ),
                                                onPressed: () {
                                                  //fungsi batal
                                                  Navigator.pop(context, 'Batal');
                                                },
                                                child: Text(
                                                  "Batal",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.black,
                                                      fontFamily: 'Comfortaa'
                                                  ),
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                      );
                    },
                    child: Text(
                      this.user.profileURL != "" ? "Ubah Foto Profile" : "Tambah Foto Profile",
                      style: TextStyle(
                          color: HexColor('#F8B50F'),
                          fontSize: 15.0,
                          decoration: TextDecoration.underline
                      ),
                    ),
                  ),
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
                        // Positioned(
                        //   right: 0,
                        //   top: -10,
                        //   child: Card(
                        //     color: Colors.transparent,
                        //     elevation: 18.0,
                        //     shape: CircleBorder(),
                        //     child: CircleAvatar(
                        //       backgroundColor: HexColor('#F8B50F'),
                        //       radius: 30.0,
                        //       child: IconButton(
                        //         onPressed: (){
                        //           print('clicked');
                        //         },
                        //         icon: Icon(
                        //           Icons.edit_outlined,
                        //           size: 32.0,
                        //         ),
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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