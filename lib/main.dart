import 'package:flutter/material.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/EmailVerificationScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/InputEmailScreen.dart';
import 'package:project_simpin_syariah/views/forgetpassword/screens/MakeNewPassScreen.dart';
import 'package:project_simpin_syariah/views/home/screen/HomeScreen.dart';
import 'package:project_simpin_syariah/views/login/screen/LoginScreen.dart';

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
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/lupa-password': (context) => InputEmailScreen(),
        '/verifikasi-email': (context) => EmailVerificationScreen(),
        '/buat-password-baru': (context) => MakeNewPassScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
