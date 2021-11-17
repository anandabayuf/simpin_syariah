import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/views/appversion/screen/AppVersionScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/EmailVerificationScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/InputEmailScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/MakeNewPassScreen.dart';
import 'package:project_simpin_syariah/views/home/screen/HomeScreen.dart';
import 'package:project_simpin_syariah/views/login/screen/LoginScreen.dart';
import 'package:project_simpin_syariah/views/pembiayaan/screens/DetailRiwayatPembiayaanScreen.dart';
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
        fontFamily: 'Comfortaa'
      ),
      initialRoute: '/simpanan/riwayat',
      routes: {
        '/login': (context) => LoginScreen(),
        '/lupa-password': (context) => InputEmailScreen(),
        '/verifikasi-email': (context) => EmailVerificationScreen(),
        '/buat-password-baru': (context) => MakeNewPassScreen(),
        '/home': (context) => HomeScreen(),
        '/versi': (context) => AppVersionScreen(),
        '/profile': (context) => ProfileScreen(),
        '/pembiayaan/riwayat': (context) => RiwayatPembiayaanScreen(),
        '/pembiayaan/riwayat/detail': (context) => DetailRiwayatPembiayaanScreen(),
        '/simpanan/riwayat': (context) => RiwayatSimpananScreen(),
      },
    );
  }
}
