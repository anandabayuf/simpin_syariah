import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

typedef void UploadImageProfileFunction();

class EditButtonProfilePicture extends StatelessWidget{
  final bool isNoPicture;
  final UploadImageProfileFunction uploadImageProfileFunction;

  EditButtonProfilePicture(this.isNoPicture, this.uploadImageProfileFunction);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
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
              uploadImageProfileFunction();
            },
            icon: Icon(
              this.isNoPicture ? Icons.add : Icons.edit_outlined,
              size: 32.0,
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}