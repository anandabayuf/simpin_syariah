import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/pembiayaan/Pembiayaan.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/customwidgets/FailedInformation.dart';
import 'package:project_simpin_syariah/views/customwidgets/SuccessInformation.dart';

typedef void SetStateButtonAjukanFunction(bool value);

class ConfirmationDialog extends AlertDialog {
  final Pembiayaan pembiayaan;
  final SetStateButtonAjukanFunction setStateButtonAjukanFunction;
  final BuildContext screenDialogContext;
  final BuildContext showConfirmationDialogContext;

  ConfirmationDialog(this.screenDialogContext, this.showConfirmationDialogContext,
      this.pembiayaan, this.setStateButtonAjukanFunction):super(
    backgroundColor: Colors.white.withOpacity(0.5),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(32.0)
        )
    ),
    actionsPadding: EdgeInsets.all(10.0),
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
          "Apakah anda yakin ingin mengajukan pembiayaan?",
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
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10.0,
                primary: HexColor("#F8B50F"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                setStateButtonAjukanFunction(true);

                Navigator.pop(showConfirmationDialogContext);

                Future.delayed(
                  Duration(
                  seconds: 3
                  ),
                  (){
                    setStateButtonAjukanFunction(false);
                    //cuma dummy check
                    if(pembiayaan.nilaiPPA != 0){
                      //data pembiayaan masuk ke backend

                      //...
                      Navigator.popUntil(screenDialogContext, ModalRoute.withName('/pembiayaan/riwayat'));
                      ScaffoldMessenger.of(screenDialogContext).showSnackBar(
                          SuccessInformation(screenDialogContext, 'Pembiayaan berhasil diajukan')
                      );
                    } else{
                      ScaffoldMessenger.of(screenDialogContext).showSnackBar(
                          FailedInformation(screenDialogContext, 'Pembiayaan gagal diajukan, periksa kembali data yang anda masukkan')
                      );
                    }
                  }
                );
              },
              child: CustomText("Ajukan", 15.0, false),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10.0,
                  primary: Colors.white.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: (){
                  Navigator.of(showConfirmationDialogContext).pop();
                },
                child: Text(
                  "Batal",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'Comfortaa'
                  ),
                )
            ),
          ),
        ],
      )
    ],
  );
}