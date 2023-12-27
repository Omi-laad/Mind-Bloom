import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/detail_audio_page.dart';
import 'package:fmajorproject/UI/Posts_login/therapy_session/Audio_calling.dart';
import 'package:fmajorproject/UI/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:fmajorproject/internet_connectivity.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mind Bloom',
      theme: ThemeData(
        primarySwatch:Colors.teal,
            scaffoldBackgroundColor:Colors.black,
            hintColor: Colors.white,
          textTheme:
      TextTheme(
      titleMedium: TextStyle(color: Colors.white
      ),
      ),
      ),
      debugShowCheckedModeBanner:false,
      home:PostScreen(),
      //home:SplashScreen(),
    );
  }
}