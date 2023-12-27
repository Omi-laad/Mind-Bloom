
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fmajorproject/UI/AUTH/login_screen.dart';

import '../UI/Posts_login/post_screen.dart';

class SplashServices{
  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user!= null){
   Timer(const Duration(seconds: 8),
           ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> PostScreen())));
  }else{
      Timer(const Duration(seconds: 8),
              ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen())));

    }
  }
}