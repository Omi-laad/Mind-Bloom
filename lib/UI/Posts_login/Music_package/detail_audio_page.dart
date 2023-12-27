
/*import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fmajorproject/UI/AUTH/login_screen.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/Music_screen.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/audio_file.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
import 'package:fmajorproject/utils/utils.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/Ui_Colors.dart' as AppColors;

class DetailedAudioPage extends StatefulWidget {
  final booksData;
  final int index;
  const DetailedAudioPage({Key? key, this.booksData,  required this.index}) : super(key: key);


  @override
  State<DetailedAudioPage> createState() => _DetailedAudioPageState();
}

class _DetailedAudioPageState extends State<DetailedAudioPage> {
  final auth = FirebaseAuth.instance;
  late AudioPlayer advancedPlayer;
  @override
  void initState(){
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
final double screenHeight= MediaQuery.of(context).size.height;
final double screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:AppColors.audioBluishbackground,
      body:Stack(
        children: [
          Positioned(
            top:0,
      left: 0,
      right: 0,
      height: screenHeight/3,
          child: Container(
          color: Colors.teal,
          ),),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading:IconButton(onPressed: (){
                  advancedPlayer.stop();
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context)=>MusicScreen(),
                      )
                  );
                }, icon:Icon(Icons.arrow_back_ios)),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight*0.2,
            height: screenHeight*0.36,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children:[
                  SizedBox(height: screenHeight*0.1,),
                  Text(this.widget.booksData[this.widget.index]["title"],
                    style:TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "avenir"
                    ) ,),
                  Text(this.widget.booksData[this.widget.index]["text"],
                      style:TextStyle(
                    fontSize: 20,
                  )
                  ),
                  AudioFile(advancedPlayer: advancedPlayer,audioPath:this.widget.booksData[this.widget.index]["audio"]),
                ]
              ),
          ),),
          Positioned(
              top: screenHeight*0.12,
              left:(screenWidth-150)/2,
              right:(screenWidth-150)/2,
              height: screenHeight*0.16,
              child: Container(
            decoration: BoxDecoration(
                color: AppColors.audioGreyBackground,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white,width: 2)
            ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                     //borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 5),
                      image: DecorationImage(image: AssetImage(this.widget.booksData[this.widget.index]["img"]),
                      fit: BoxFit.cover),
                    ),
                  ),

                ),
              ),
          ),
        ],
      ),

      
    );
  }
}*/