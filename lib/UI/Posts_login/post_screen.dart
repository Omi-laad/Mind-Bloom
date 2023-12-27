import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fmajorproject/UI/AUTH/login_screen.dart';
import 'package:fmajorproject/UI/Posts_login/AboutUsScreen.dart';
import 'package:fmajorproject/UI/Posts_login/Home_listview.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/Ui_Colors.dart';
import 'package:fmajorproject/UI/Posts_login/therapy_session/Audio_calling.dart';
import 'package:fmajorproject/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'Music_package/Music_screen.dart';
class PostScreen extends StatefulWidget {




  PostScreen({Key? key}):super(key: key);
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
 final auth = FirebaseAuth.instance;


final  List images =[
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg',
  'assets/images/4.jpg',
  'assets/images/25.jpg',
  'assets/images/6.jpg',
  'assets/images/17.jpg',
  'assets/images/8.jpg',
  'assets/images/9.jpg',
  'assets/images/10.jpg',
  'assets/images/11.jpg',
  'assets/images/65.jpg',
  'assets/images/13.jpg',
  'assets/images/14.jpg',
  'assets/images/15.jpg',
  'assets/images/68.jpg',
  'assets/images/38.jpg',
  'assets/images/48.jpg',
  'assets/images/59.jpg',
  'assets/images/62.jpg',
  'assets/images/60.jpg',
  'assets/images/43.jpg',

];

 @override
  Widget build(BuildContext context) {
    Widget image_carousel =
      new Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      height: 225,
       width: MediaQuery.of(context).size.width,
       child: CarouselSlider(
           items: images.map((item) => Container(child: Center(
                 child: Image.asset(
                   item,
                 fit: BoxFit.cover,
                 width: 1000,),
               ),
           )).toList(),
           options: CarouselOptions(
             autoPlay: true,
             aspectRatio: 2.0,
             enlargeCenterPage: true,
           )),
   );

    return WillPopScope(
        onWillPop: ()async {
      SystemNavigator.pop();
      return true;
    },
   child:Scaffold(
      appBar: AppBar(
        title: Text("MIND BLOOM"),
        centerTitle: true,
      ),
      drawer: new Drawer(
        backgroundColor: Colors.black,
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(accountName: Text('tester'),
              accountEmail: Text("test@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.teal[300]
              ),
            ),
            // body

            InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "You are in Home Screen",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.teal[300],
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
              child: ListTile(
                title: Text('Home Page',style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.home, color: Colors.teal[300],),
              ),
            ),


            /*InkWell(
              onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => MusicScreen()));

              },
              child: ListTile(
                title: Text('Music',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.queue_music_rounded, color: Colors.teal[300],),
              ),
            ),*/
            InkWell(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AudioPage()));

              },
              child: ListTile(
                title: Text('Therapy Session',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.wifi_calling_sharp, color: Colors.teal[300],),
              ),
            ),

            Divider(),



            InkWell(
              onTap: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsScreen()));

              },
              child: ListTile(
                title: Text('About Us',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.help, color: Colors.grey,),
              ),
            ),
            InkWell(
              onTap: () {
                auth.signOut().then((value){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>LoginScreen()));
                }).onError((error,stackTracr){
                  utils().toastMessage(error.toString());
                });
              },
              child: ListTile(
                title: Text('Logout',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.logout_outlined ,color: Colors.grey,),
              ),
            ),

          ],
        ),
      ),
      body:SafeArea(
        child: new Column(
          children: [
            image_carousel,
            Flexible(child: Feed()),
          ],
        ),
      ),

      //Feed(),
    )
    );
  }
}

