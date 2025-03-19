import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_project/Screen/BottomNavigation/bottom_nav.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
     
        child: Lottie.asset(
          "assets/Json/splash.json",
          fit: BoxFit.cover,
          height: 300,
          width: 250,
        ),
      ),
    );
  }

  Future<Timer> loadSplash() async {
    return Timer(
      const Duration(seconds: 6),
      onDoneLoading,
    );
  }

  onDoneLoading() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => const BottomNav()),
      ),
    );
  }
}
