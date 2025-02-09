import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/bottom_nav.dart';
import 'package:login_project/Splash/splash_screen.dart';
// import 'package:login_project/Splash/splash_screen.dart';
// import 'package:login_project/bottom/school.dart';
// ignore: depend_on_referenced_packages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNav(), //SplashScreen()
      ),
    );
  }
}
