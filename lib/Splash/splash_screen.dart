import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_project/Screen/login.dart';
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
      child: Lottie.asset("assets/splash.json",
          fit: BoxFit.cover, height: 300, width: 300),
    );
  }

  Future<Timer> loadSplash() async {
    return Timer(
      const Duration(seconds: 3),
      onDoneLoading,
    );
  }

  onDoneLoading() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => const Login()),
      ),
    );
  }
}
