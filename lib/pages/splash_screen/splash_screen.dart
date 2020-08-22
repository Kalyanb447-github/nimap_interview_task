import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimap_interview_task/pages/main_screen/main_screen.dart';
import 'package:nimap_interview_task/pages/widgets/no_internet_screen/no_internet_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result.index == 2) {
        Get.dialog(NoInternetConnection());
      }
    });

    goToMainScreenAfter2Second();
  }

  goToMainScreenAfter2Second() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/splash.png',
        fit: BoxFit.fill,
      ),
    ));
  }
}
