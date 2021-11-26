import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/user/User.dart';
import 'package:project_simpin_syariah/views/customwidgets/ButtonIcon.dart';
import 'package:project_simpin_syariah/views/home/widgets/BannerCarousel.dart';
import 'package:project_simpin_syariah/views/home/widgets/ContainerTitle.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';

class HomeScreen extends StatelessWidget{
  final User user;

  HomeScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerTitle(),
        SizedBox(height: 30.0,),
        Align(
          child: CustomText('Halo, ${this.user.name}', 20.0, true),
          alignment: Alignment.centerLeft,
        ),
        SizedBox(height: 30.0,),
        BannerCarousel(),
        SizedBox(height: 30.0,),
        Row(
          children: [
            Expanded(
                child: ButtonIcon(
                    "Pembiayaan",
                    "assets/icons/home/pembiayaan.svg",
                    "/pembiayaan/riwayat"
                )
            ),
            Expanded(
                child: ButtonIcon(
                    "Investasi",
                    "assets/icons/home/investasi.svg",
                    "/investasi/riwayat"
                )
            ),
            Expanded(
                child: ButtonIcon(
                    "Simpanan",
                    "assets/icons/home/simpanan.svg",
                    "/simpanan/riwayat"
                )
            ),
          ],
        )
      ],
    );
  }
}