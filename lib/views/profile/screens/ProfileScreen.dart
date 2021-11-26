import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/models/user/User.dart';
import 'package:project_simpin_syariah/views/profile/screens/UbahPasswordScreen.dart';
import 'package:project_simpin_syariah/views/profile/widgets/AppVersionDialog.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/profile/widgets/EditButtonProfilePicture.dart';
import 'package:project_simpin_syariah/views/profile/widgets/FormProfile.dart';
import 'package:project_simpin_syariah/views/profile/widgets/PlaceholderImage.dart';
import 'package:project_simpin_syariah/views/profile/widgets/ProfileImageContainer.dart';

class ProfileScreen extends StatefulWidget{
  final User user;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ProfileScreen(this.scaffoldKey, this.user);

  @override
  _ProfileScreenState createState() => _ProfileScreenState(this.scaffoldKey, this.user);
}

class _ProfileScreenState extends State<ProfileScreen>{
  final User user;
  final GlobalKey<ScaffoldState> scaffoldKey;

  late bool isEditProfile;


  _ProfileScreenState(this.scaffoldKey, this.user);

  @override
  void initState() {
    isEditProfile = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setIsEditProfileValue(bool value){
    setState(() {
      this.isEditProfile = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        this.isEditProfile ? SizedBox.shrink() : Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                print("versi");
                showDialog<String>(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) =>
                        AppVersionDialog(context)
                );
              },
              icon: Icon(
                Icons.info_outline,
                size: 32.0,
                color: Colors.white,
              )
          ),
        ),
        SizedBox(height: 15.0,),
        this.isEditProfile ? SizedBox.shrink() : this.user.profileURL != "" ? ProfileImageContainer(this.user.profileURL)
            : PlaceholderImage(),
        SizedBox(height: 30.0,),
        this.isEditProfile ? FormProfile(this.scaffoldKey, this.user, this.setIsEditProfileValue) : Container(
          width: screenSize.width ,
          height: 39,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 15.0
                  ),
                  elevation: 10,
                  primary: Colors.white.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  )
              ),
              onPressed: () {
                setState(() {
                  this.isEditProfile = !this.isEditProfile;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_outlined,
                    size: 21.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10.0,),
                  CustomText('EDIT PROFILE', 15.0, false)
                ],
              )
          ),
        ),
        this.isEditProfile ? SizedBox.shrink() : SizedBox(height: 30.0,),
        this.isEditProfile ? SizedBox.shrink() : Container(
          width: screenSize.width ,
          height: 39,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 15.0
                  ),
                  elevation: 10,
                  primary: Colors.white.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UbahPasswordScreen())
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 21.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10.0,),
                  CustomText('UBAH PASSWORD', 15.0, false)
                ],
              )
          ),
        ),
        this.isEditProfile ? SizedBox.shrink() : SizedBox(height: 30.0,),
        this.isEditProfile ? SizedBox.shrink() : Container(
          width: screenSize.width ,
          height: 39,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 15.0
                  ),
                  elevation: 10,
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  )
              ),
              onPressed: () {
                //logic logout

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/login",
                  (Route<dynamic> route) => false,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    size: 21.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10.0,),
                  CustomText('KELUAR', 15.0, false)
                ],
              )
          ),
        )
      ],
    );
  }
}