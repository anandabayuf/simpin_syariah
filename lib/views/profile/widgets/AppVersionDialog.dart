import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

final String appVer = "2.1";

class AppVersionDialog extends AlertDialog {
  AppVersionDialog(BuildContext context):super(
    backgroundColor: Colors.white.withOpacity(0.5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(19.0)
        )
    ),
    title: Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              size: 24.0,
              color: Colors.white,
            )
          ),
        ),
        Image.asset(
          "assets/images/login/LambangKoperasi.png",
          width: 200,
        ),
        SizedBox(
          height: 15.0,
        ),
        CustomText("Simpin Syariah", 24.0, false),
        SizedBox(
          height: 5.0,
        ),
        CustomText("Versi $appVer", 15.0, true),
      ],
    ),
  );
}