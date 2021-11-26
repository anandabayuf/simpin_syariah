import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

typedef void UploadImageFunc();

class UploadContainer extends StatelessWidget{
  final UploadImageFunc uploadImageFunc;

  UploadContainer(this.uploadImageFunc);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('unggah');
        uploadImageFunc();
      },
      child: DottedBorder(
        color: Colors.white.withOpacity(0.5),
        borderType: BorderType.RRect,
        radius: Radius.circular(10.0),
        padding: EdgeInsets.all(10.0),
        dashPattern: [10, 10,],
        child: Container(
          width: 138,
          height: 85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_circle_up,
                size: 48.0,
                color: Colors.white.withOpacity(0.5),
              ),
              SizedBox(height: 10.0,),
              CustomText("Unggah", 15.0, true)
            ],
          ),
        ),
      ),
    );
  }
}