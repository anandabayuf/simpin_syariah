import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/notifikasi/Notifikasi.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/notification/widgets/ContainerNotification.dart';

class NotificationScreen extends StatelessWidget{
  final List<Notifikasi> listDataNotifikasi;

  NotificationScreen(this.listDataNotifikasi);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText('Notifikasi', 24.0, false)
        ),
        SizedBox(height: 30.0,),
        ContainerNotification(this.listDataNotifikasi)
      ],
    );
  }
}