import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rare_task/res/app_constants.dart';
import 'package:rare_task/res/text_widget.dart';
import 'package:rare_task/view/home/bottom_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/screens/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: LottieBuilder.asset(
                'assets/json/splash.json',
              ),
            ),
          ],
        ),
      ),
    );
  }

  route() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool logged = prefs.getBool('logged') ?? false;

    if (logged) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavigator()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen()));
    }
  }
}
