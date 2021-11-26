import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

typedef void CameraFunction();
typedef void GalleryFunction();

class UploadPicker extends StatelessWidget{
  final BuildContext uploadPickerContext;
  final CameraFunction cameraFunc;
  final GalleryFunction galleryFunc;

  UploadPicker(this.uploadPickerContext, this.galleryFunc, this.cameraFunc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 187,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(29),
            topLeft: Radius.circular(29)),
        color: HexColor("#50AEA7"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText("Unggah gambar dari", 20.0, false),
          SizedBox(height: 10.0,),
          ListTile(
              leading: new Icon(
                Icons.photo_library,
                size: 24.0,
                color: Colors.white,
              ),
              title: new CustomText(
                  "Galeri",
                  15.0,
                  false
              ),
              onTap: () {
                // this.getKTPFromGallery();
                galleryFunc();
                Navigator.of(uploadPickerContext).pop();
              }),
          ListTile(
            leading: new Icon(
              Icons.photo_camera,
              size: 24.0,
              color: Colors.white,
            ),
            title: new CustomText(
                "Kamera",
                15.0,
                false
            ),
            onTap: () {
              // this.getKTPFromCamera();
              cameraFunc();
              Navigator.of(uploadPickerContext).pop();
            },
          ),
        ],
      ),
    );
  }
}