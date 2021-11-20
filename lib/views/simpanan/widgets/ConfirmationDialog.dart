import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/simpanan/Simpanan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';
import 'package:project_simpin_syariah/views/customwidgets/SuccessInformation.dart';

class ConfirmationDialog extends AlertDialog {
  final Simpanan simpanan;

  ConfirmationDialog(BuildContext context, this.simpanan):super(
    backgroundColor: Colors.white.withOpacity(0.5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(32.0)
        )
    ),
    title: Column(
      children: [
        Image.asset(
          "assets/icons/dialog/icon-question.png",
          width: 150,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Apakah anda yakin ingin menambahkan simpanan?",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Comfortaa',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Pastikan data yang anda isi sudah benar.",
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white.withOpacity(0.5),
            fontFamily: 'Comfortaa',
          ),
          textAlign: TextAlign.center,
        )
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10.0,
              primary: HexColor("#F8B50F"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              if(simpanan.nominalSimpanan != 0){
                Navigator.popUntil(context, ModalRoute.withName('/simpanan/riwayat'));
                ScaffoldMessenger.of(context).showSnackBar(
                    SuccessInformation(context, 'Simpanan berhasil ditambahkan')
                );
              } else{
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    FailedInformation(context, 'Simpanan gagal ditambahkan, periksa kembali data yang anda masukkan')
                );
              }
            },
            child: CustomText("Ajukan", 15.0, false),
          ),
          SizedBox(width: 20.0),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10.0,
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: (){
                Navigator.of(context).pop();
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
        ],
      )
    ],
  );
}