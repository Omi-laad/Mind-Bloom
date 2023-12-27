import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
import 'package:fmajorproject/utils/utils.dart';
import 'dart:math' as math ;

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../AUTH/login_screen.dart';
import '../AboutUsScreen.dart';
import '../Music_package/Music_screen.dart';

 class AudioPage extends StatefulWidget {
   const AudioPage({Key? key}) : super(key: key);

   @override
   State<AudioPage> createState() => _AudioPageState();
 }
final String localUserId = math.Random().nextInt(1000).toString();
 class _AudioPageState extends State<AudioPage> {
   final calIdTextCtrl = TextEditingController();
   final auth = FirebaseAuth.instance;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
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
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => PostScreen()));
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
                 Fluttertoast.showToast(
                     msg: "You are in Therapy Session Screen",
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 1,
                     backgroundColor: Colors.teal[300],
                     textColor: Colors.white,
                     fontSize: 16.0
                 );
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
       body: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(14),
               child: SizedBox.fromSize(
                 size:  const Size.fromRadius(65),
                 child: Image.asset('img/App_logo.jpg',
                   //fit: BoxFit.cover,
                 ),
               ),
             ),
             SizedBox(height: 28,),

             Row(
               children: [
                 Expanded(

                     child:
                 TextFormField(
                   controller: calIdTextCtrl,
                   decoration: InputDecoration(
                     labelText: 'Join a Call by Id',),
                 )
                 ),
               ],
             ),
             ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return CallPage(CallId: calIdTextCtrl.text,);
                   }));
                 },
                 child: Text('Join')),
             SizedBox(height: 28,),
             Text("Enter any of these below ID to have a Therapy Session",style: TextStyle(fontSize:14,color: Colors.white),),
             Text("1).7539",style: TextStyle(fontSize:20,color: Colors.white,),),
             Text("2).7849",style: TextStyle(fontSize:20,color: Colors.white),),

           ],

         ),
         ),

     );
   }
 }

 class CallPage extends StatelessWidget {
   const CallPage({Key? key, required this.CallId}) : super(key: key);
final String CallId;

   @override
   Widget build(BuildContext context) {
     return SafeArea(
       child: ZegoUIKitPrebuiltCall(
         appSign: Utils.appSignIn,
         appID: Utils.appId,
         userID:localUserId ,
         userName: "user1",
         callID: CallId,
         config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()..onOnlySelfInRoom=(context)
        { Navigator.of(context).pop();} ,
       ),

     );
   }
 }
