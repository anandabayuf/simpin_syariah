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

  void setIndex(){
    switch(ModalRoute.of(context)!.settings.name){
      case "/home" : //home
        setState(() {
          this.index = 0;
        });
        break;
      case "/pembiayaan/riwayat" : //pembiayaan
        setState(() {
          this.index = 1;
        });
        break;
      case "/investasi/riwayat" : //investasi
        setState(() {
          this.index = 2;
        });
        break;
      case "/simpanan/riwayat" : //simpanan
        setState(() {
          this.index = 3;
        });
        break;
      case "/profile" : //profile
        setState(() {
          this.index = 4;
        });
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    setIndex();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: HexColor("#50AEA7"),
          elevation: 10.0,
          currentIndex: this.index,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (int item){
            _onItemTapped(item);
          },

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
                color: Colors.white.withOpacity(0.5),
              ),
              title: CustomText('Home', 12.0, true),
                activeIcon: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  radius: 25.0,
                )
            ),
            BottomNavigationBarItem(
              icon: svgIcon('assets/icons/bottomnav/pembiayaan.svg', false),
              title: CustomText('Pembiayaan', 12.0, true),
              activeIcon: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: svgIcon('assets/icons/bottomnav/pembiayaan.svg', true),
                radius: 25.0,
              )
            ),
            BottomNavigationBarItem(
                icon: svgIcon('assets/icons/bottomnav/investasi.svg', false),
                title: CustomText('Investasi', 12.0, true),
                activeIcon: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: svgIcon('assets/icons/bottomnav/investasi.svg', true),
                  radius: 25.0,
                )
            ),
            BottomNavigationBarItem(
              icon: svgIcon('assets/icons/bottomnav/simpanan.svg', false),
              title: CustomText('Simpanan', 12.0, true),
              activeIcon: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: svgIcon('assets/icons/bottomnav/simpanan.svg', true),
                radius: 25.0,
              )
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/appbar/profilepict.png'),
                  radius: 20.0,
                  backgroundColor: Colors.transparent,
                ),
                title: CustomText('', 12.0, true),
                activeIcon: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/appbar/profilepict.png'),
                    radius: 20.0,
                    backgroundColor: Colors.transparent,
                  ),
                  radius: 25.0,
                )
            ),
          ],
        ),
      )
    );
  }

  void _onItemTapped(int item) {
    switch(item){
      case 0 : //home
        if(ModalRoute.of(context)!.settings.name != "/home"){
          Navigator.pushReplacementNamed(context, "/home");
        }
        break;
      case 1 : //pembiayaan
        if(ModalRoute.of(context)!.settings.name != "/pembiayaan/riwayat"){
          Navigator.pushReplacementNamed(context, "/pembiayaan/riwayat");
        }
        break;
      case 2 : //investasi
        if(ModalRoute.of(context)!.settings.name != "/investasi/riwayat"){
          Navigator.pushReplacementNamed(context, "/investasi/riwayat");
        }
        break;
      case 3 : //simpanan
        if(ModalRoute.of(context)!.settings.name != "/simpanan/riwayat"){
          Navigator.pushReplacementNamed(context, "/simpanan/riwayat");
        }
        break;
      case 4 : //profile
        if(ModalRoute.of(context)!.settings.name != "/profile"){
          Navigator.pushReplacementNamed(context, "/profile");
        }
        break;
    }
  }

  Widget svgIcon(String assetLoc, bool isSelected){
    return SvgPicture.asset(
      assetLoc,
      height: 30.0,
      width: 30.0,
      color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
    );
  }
}