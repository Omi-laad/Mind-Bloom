import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fmajorproject/UI/AUTH/login_screen.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/Music_screen.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
import 'package:fmajorproject/UI/Posts_login/therapy_session/Audio_calling.dart';
import 'package:fmajorproject/utils/utils.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
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
                    MaterialPageRoute(builder: (context) => PostScreen()
                    )
                );
              },
              child: ListTile(
                title: Text('Home Page',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.home, color: Colors.teal[300],),
              ),
            ),

            /*InkWell(
              onTap: () {
             /*   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MusicScreen()));*/
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
                Fluttertoast.showToast(
                    msg: "You are in AboutUs Screen",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.teal[300],
                    textColor: Colors.white,
                    fontSize: 16.0
                );
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
 body:Container(
     child: SingleChildScrollView(
       child: ConstrainedBox(
         constraints: BoxConstraints(
         ),
         child: IntrinsicHeight(
           child: Column(
             children: <Widget>[
               Container(
                 // A fixed-height child.
                 // Yellow
                 height: 300.0,
                 alignment: Alignment.center,
                 child: Image.asset("img/App_logo.jpg",
                   width: double.maxFinite,
                   fit:BoxFit.cover,),
               ),
               Expanded(
                 // A flexible child that will grow to fit the viewport but
                 // still be at least as big as necessary to fit its contents.
                 child: Container(
                   height:1150,
                  // width: double.maxFinite,
                   child:
                   Column(
                     children: [
                       Align(
                         alignment: Alignment.bottomCenter,
                         child: const Text('Welcome to our  application MINDBLOOM -HEALING MENTAL HEALTH USING TECHNOLOGY We are a team of 4 our team has divided the work of our application.Application development is all done by Omkar Laad,UI designing is all done by Vruksha Kothari,All documentation work is done by Tanvi Kalantre and lastly all testing is done by Anurag Kamat.We are committed to provide the best mental health support to our users.Our mission is to make mental health support accessible and convenient for everyone. '
                             '\n We understand that mental health issues can be challenging and overwhelming, and we are here to help you through it.''We believe that everyone deserves access to mental health support,regardless of their location, schedule, or financial situation. That\'s why our application is available 24/7, and our prices are affordable.'
                           'We also understand the importance of privacy and confidentiality when it comes to mental health. Our application is designed to protect your data, and our mental health professionals follow strict ethical guidelines to ensure your privacy and confidentiality.'
                           'We are dedicated to helping you achieve better mental health and well-being. Whether you need someone to talk to, guidance on coping strategies, or access to resources, we are here to support you.'
                           '\n Thank you for choosing our mental health application. We look forward to helping you on your mental health journey.',
                             textAlign:TextAlign.center,
                           style: TextStyle(fontSize:20,fontFamily:"Times new Roman",color: Colors.white,),
                             softWrap:false,maxLines:50,overflow: TextOverflow.ellipsis,
                         ),
                       ),
                     ],
                   ),
               ),
               ),

             ],
           ),
         ),
       ),
     ),

   /*child:  Row(

 children: [
   Expanded(child: SingleChildScrollView(
   scrollDirection: Axis.vertical,
   child:Text('Welcome to our mental health app! We are a team of passionate professionals dedicated to promoting and improving mental health through innovative technology. Our mission is to provide accessible and convenient mental health resources to individuals all over the world, with the goal of reducing stigma and empowering people to take charge of their mental wellness.'
   ' Our app is designed with the user in mind, featuring a user-friendly interface and intuitive navigation to make it easy to use. We offer a variety of features and resources to support mental health, including therapy service , music for different situations and inspirational quotes.'
   'We believe that everyone deserves access to quality mental health care, regardless of their location or financial situation. That’s why our app is affordable and accessible, with a variety of pa. Our team is committed to providing the highest level of care and support to our users, and we are constantly working to improve our app and expand our services to meet the ever-evolving needs of the mental health community.'
     "Thank you for choosing our mental health app as your partner in mental wellness. We are honored to be a part of your journey towards a healthier, happier life."
     ,style: TextStyle(fontSize:22,fontFamily: "avenir"),
     softWrap:false,
     maxLines:50,overflow: TextOverflow.ellipsis,
   ),
 )
    )
    ],
    ),
   /*CustomScrollView(
     slivers: [
       /*SliverAppBar(
         pinned: true,
         expandedHeight: 300,
         flexibleSpace: FlexibleSpaceBar(
           background: Image.asset("img/App_logo.jpg",
           width: double.maxFinite,
             fit:BoxFit.cover,
           ),
         ),
       ),*/

       SliverToBoxAdapter(
         child: Row(
           children: [Expanded(child: Text('Welcome to our mental health app! We are a team of passionate professionals dedicated to promoting and improving mental health through innovative technology. Our mission is to provide accessible and convenient mental health resources to individuals all over the world, with the goal of reducing stigma and empowering people to take charge of their mental wellness.'
     ' Our app is designed with the user in mind, featuring a user-friendly interface and intuitive navigation to make it easy to use. We offer a variety of features and resources to support mental health, including therapy service , music for different situations and inspirational quotes.'
      'We believe that everyone deserves access to quality mental health care, regardless of their location or financial situation. That’s why our app is affordable and accessible, with a variety of pa. Our team is committed to providing the highest level of care and support to our users, and we are constantly working to improve our app and expand our services to meet the ever-evolving needs of the mental health community.'
      "Thank you for choosing our mental health app as your partner in mental wellness. We are honored to be a part of your journey towards a healthier, happier life."
               ,style: TextStyle(fontSize:22,fontFamily: "avenir"),
                 softWrap:false,
               maxLines:40,overflow: TextOverflow.ellipsis,
             )
             )
           ],
         ),
       ),
     ],
   ),*/
*/ ),

    );

      }
}
