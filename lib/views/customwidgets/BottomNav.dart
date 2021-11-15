import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';


class BottomNav extends StatefulWidget{
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10)
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0.5),
          elevation: 10.0,
          currentIndex: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,

          items: <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.home,
            //     size: 30.0,
            //     color: Colors.white.withOpacity(0.5),
            //   ),
            //   title: CustomText('Home', 12.0, true)
            // ),
            BottomNavigationBarItem(
              icon: svgIcon('assets/icons/bottomnav/pembiayaan.svg'),
              title: CustomText('Pembiayaan', 12.0, true),
              activeIcon: CircleAvatar(
                backgroundColor: HexColor("#F8B50F"),
                child: svgIcon('assets/icons/bottomnav/pembiayaan.svg'),
                radius: 25.0,
              )
            ),
            BottomNavigationBarItem(
                icon: svgIcon('assets/icons/bottomnav/investasi.svg'),
                title: CustomText('Investasi', 12.0, true)
            ),
            BottomNavigationBarItem(
                icon: svgIcon('assets/icons/bottomnav/simpanan.svg'),
                title: CustomText('Simpanan', 12.0, true)
            ),
          ],
        ),
      )
    );
  }

  void _onItemTapped(int index) {

  }

  Widget svgIcon(String assetLoc){
    return SvgPicture.asset(
      assetLoc,
      height: 30.0,
      width: 30.0,
      color: Colors.white.withOpacity(0.5),
    );
  }
}