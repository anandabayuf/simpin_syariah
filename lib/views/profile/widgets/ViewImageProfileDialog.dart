import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/profile/widgets/ProfileImageContainer.dart';

typedef void UploadFunction(StateSetter setState);
typedef void DeleteFunction(StateSetter setState);

class ViewImageProfileDialog extends StatelessWidget{
  final BuildContext showImageDialogContext;
  final StateSetter setState;
  final XFile file;
  final UploadFunction uploadFunc;
  final DeleteFunction deleteFunc;

  const ViewImageProfileDialog(this.showImageDialogContext, this.setState, this.file, this.uploadFunc,
      this.deleteFunc);

  @override
  Widget build(BuildContext context) {
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
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: (){
                  Navigator.of(showImageDialogContext).pop();
                },
                icon: Icon(
                  Icons.close,
                  size: 24.0,
                  color: Colors.white,
                )
            ),
          ),
          SizedBox(height: 10),
          this.file.path == "" ?
          CustomText("Gambar Belum Di-upload", 15.0, true)
              : ProfileImageContainer(this.file.path),
          SizedBox(height: 20),
          Container(
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
                  this.uploadFunc(this.setState);
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
                  this.deleteFunc(this.setState);
                  Navigator.pop(showImageDialogContext);
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
        ],
      ),
    );
  }
}