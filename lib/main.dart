import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/views/Main.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/EmailVerificationScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/InputEmailScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/MakeNewPassScreen.dart';
import 'package:project_simpin_syariah/views/home/screen/HomeScreen.dart';
import 'package:project_simpin_syariah/views/investasi/screens/RiwayatInvestasiScreen.dart';
import 'package:project_simpin_syariah/views/login/screen/LoginScreen.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/RiwayatPembiayaanScreen.dart';
import 'package:project_simpin_syariah/views/profile/screens/ProfileScreen.dart';
import 'package:project_simpin_syariah/views/simpanan/screens/RiwayatSimpananScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simpin Syariah',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }
        )
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/lupa-password': (context) => InputEmailScreen(),
        '/verifikasi-email': (context) => EmailVerificationScreen(),
        '/buat-password-baru': (context) => MakeNewPassScreen(),
        '/pembiayaan/riwayat': (context) => RiwayatPembiayaanScreen(),
        '/simpanan/riwayat': (context) => RiwayatSimpananScreen(),
        '/investasi/riwayat': (context) => RiwayatInvestasiScreen(),
      },
    );
  }
}
