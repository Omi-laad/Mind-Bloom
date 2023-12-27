import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fmajorproject/firebases_services/splash_services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
SplashServices  splashScreen = SplashServices();

  @override
  void initState(){
    //implement init
    super.initState();
    splashScreen.isLogin(context);
  }
//late final AnimationsController _controller;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Center(
          child:
           Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ayiupfed.json'),
        ),
      ),

    );
  }
}
