import 'package:badges/badges.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_simpin_syariah/models/notifikasi/Notifikasi.dart';
import 'package:project_simpin_syariah/models/user/User.dart';
import 'package:project_simpin_syariah/views/customwidgets/CustomText.dart';
import 'package:project_simpin_syariah/views/home/screen/HomeScreen.dart';
import 'package:project_simpin_syariah/views/notification/screens/NotificationScreen.dart';
import 'package:project_simpin_syariah/views/profile/screens/ProfileScreen.dart';

const int HOME = 0;
const int NOTIFICATION = 1;
const int PROFILE = 2;

class Main extends StatefulWidget{
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late int index;
  final User user = User.emptyConstructor().getDummyUser();

  late Notifikasi notifikasi;
  late List<Notifikasi> listDataNotifikasi;

  late bool isNotificationClicked;

  @override
  void initState() {
    super.initState();
    index = HOME;

    this.notifikasi = new Notifikasi(0, "", "", DateTime.now(), false);
    this.listDataNotifikasi = this.notifikasi.getDataNotifikasi();

    this.isNotificationClicked = false;
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      body: ColorfulSafeArea(
        color: HexColor("#50AEA7"),
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: HexColor("#50AEA7"),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: IndexedStack(
                index: this.index,
                children: [
                  HomeScreen(this.user),
                  NotificationScreen(this.listDataNotifikasi),
                  ProfileScreen(this.user),
                ],
              )
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                    icon: numberOfUnreadNotification() > 0 ? Badge(
                      badgeContent: CustomText("${numberOfUnreadNotification()}", 12.0, false),
                      badgeColor: Colors.red,
                      animationType: BadgeAnimationType.scale,
                      child: Icon(
                        Icons.notifications,
                        size: 30.0,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ) : Icon(
                      Icons.notifications,
                      size: 30.0,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    title: CustomText('Notifikasi', 12.0, true),
                    activeIcon: numberOfUnreadNotification() > 0 ? CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: Badge(
                        badgeContent: CustomText("${numberOfUnreadNotification()}", 12.0, false),
                        badgeColor: Colors.red,
                        animationType: BadgeAnimationType.scale,
                        child: Icon(
                          Icons.notifications,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      radius: 25.0,
                    ) : CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      child: Icon(
                        Icons.notifications,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      radius: 25.0,
                    )
                ),
                BottomNavigationBarItem(
                  icon: this.user.profileURL != "" ? CircleAvatar(
                    backgroundImage: AssetImage('assets/images/appbar/profilepict.png'),
                    radius: 20.0,
                    backgroundColor: Colors.transparent,
                  ) : Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white.withOpacity(0.5),
                    size: 30.0,
                  ),
                  title: CustomText('', 12.0, true),
                  activeIcon: this.user.profileURL != "" ? CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/appbar/profilepict.png'),
                      radius: 20.0,
                      backgroundColor: Colors.transparent,
                    ),
                    radius: 25.0,
                  ) : CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    radius: 25.0,
                  ),
                ),
              ],
            ),
          )
      )
    );
  }

  int numberOfUnreadNotification(){
    return this.listDataNotifikasi.where((element) => !element.read).toList().length;
  }

  void _onItemTapped(int item) {
    print(item);
    _readNotification(item);
    setState(() {
      this.index = item;
    });
  }

  void _readNotification(int item){
    //logic:
    //ketika user click icon notif DAN ada notif,
      //maka isNotificationClicked = true
    //else ? jika user berpindah ke home / profile (item not equal to 1)
      //cek apakah sebelumnya ada notif dan user udah click notif tersebut (pake isNotificationClicked = true ? )
        //kalau iya iterasi setiap data notif, dan cek apakah read nya masih false? kalau iya jadiin true biar jadi kebaca
        //jangan lupa ganti isNotificationClicked jadi false lagi, biar else ini nya ga ke eksekusi
    if(item == NOTIFICATION && numberOfUnreadNotification() > 0){
      setState(() {
        this.isNotificationClicked = true;
      });
    } else {
      if(this.isNotificationClicked){
        this.listDataNotifikasi.forEach((element) {
          if(!element.read){
            element.read = true;
          }
        });
        setState(() {
          this.isNotificationClicked = false;
        });
      }
    }
  }
}