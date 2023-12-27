/*import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fmajorproject/UI/AUTH/login_screen.dart';
import 'package:fmajorproject/UI/Posts_login/AboutUsScreen.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/audio_file.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/detail_audio_page.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/my_tabs.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
import 'package:fmajorproject/utils/utils.dart';
import 'package:fmajorproject/UI/Posts_login/Music_package/Ui_Colors.dart' as AppColors;

import '../therapy_session/Audio_calling.dart';
class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> with SingleTickerProviderStateMixin{
  final auth = FirebaseAuth.instance;
 late ScrollController _scrollableController;
 late TabController _tabController;
  late final List popularMusic;
  late final books;
  ReadData() async {
   await DefaultAssetBundle.of(context).loadString("json/popularMusic.json").then((s){
     setState(() {
       popularMusic = json.decode(s);
     });
   });
   await DefaultAssetBundle.of(context).loadString("json/books.json").then((s){
     setState(() {
       books = json.decode(s);
     });
   });
 }


  @override
 void initState(){
   super.initState();
   ReadData();
   _tabController = TabController(length: 3, vsync: this);
   _scrollableController = ScrollController();
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     /* appBar: AppBar(
        title: Text("MIND BLOOM"),
        centerTitle: true,
      ),*/
      drawer: new Drawer(
        backgroundColor: Colors.black,
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(accountName: Text('s'),
              accountEmail: Text(",/*nameFromLogin*/"),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) =>PostScreen()));
              },
              child: ListTile(
                title: Text('Home Page',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.home, color: Colors.teal[300],),
              ),
            ),

            InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "You are in Music Screen",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.teal[300],
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
              child: ListTile(
                title: Text('Music',style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.queue_music_rounded, color: Colors.teal[300],),
              ),
            ),

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
        )
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
        child: Container(
          child: Column(
            children:  [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left:20),
                    child: Text('Popular Music',style: TextStyle(fontSize:30,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              SizedBox(height:20,),
              Container(
                height: 180,
                child: Stack(
                  children: [
                   Positioned(top: 0,left: -20,right: 0,
                child: Container(
                height: 180,
                  child:PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      itemCount: popularMusic==null?0:popularMusic.length,
                      itemBuilder: (_,i) {
                        return
                          Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(right:5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(popularMusic[i]["img"]),
                                  fit:BoxFit.fill,
                                )
                            ),
                          );
                      }),
                ),
                   )
                  ],

                  ),
                ),
              Expanded(
                  child:NestedScrollView(
                     controller: _scrollableController,
                      headerSliverBuilder: (BuildContext context, bool isScroll){
                       return[
                         SliverAppBar(
                           pinned: true,
                           backgroundColor: Colors.black,
                           bottom: PreferredSize(
                               child: Container(
                                 color: Colors.black,
                                 margin: const EdgeInsets.all(0),
                                 child: TabBar(
                                   indicatorPadding:const EdgeInsets.all(0),
                                   indicatorSize: TabBarIndicatorSize.label,
                                   labelPadding: const EdgeInsets.all(0),
                                   controller: _tabController,
                                   isScrollable: true,
                                   indicator: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     boxShadow: [
                                       BoxShadow(
                                         color: Colors.black.withOpacity(0.2),
                                         blurRadius: 7,
                                         offset: Offset(0, 0)
                                       )
                                     ]
                                   ),
                              //Tabs
                                    tabs: [
                              AppTabs(color: AppColors.menu1Color, text: "Beats"),
                                      SizedBox(width: 5,),
                                      AppTabs(color: AppColors.menu2Color, text: "Meditation"),
                                      SizedBox(width: 5,),
                                      AppTabs(color: AppColors.menu3Color, text: "Relax"),
                                    ],
                                 ),
                               ),
                               preferredSize: Size.fromHeight(50),

                           ),
                         )
                       ];
                      },
                    body: TabBarView(
                        controller: _tabController,
                        children:[
                          ListView.builder(
                            itemCount: books==null?0:books.length,
                              itemBuilder: (_,i){
                                return GestureDetector(
                                  onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) =>DetailedAudioPage(booksData:books,index:i)));
                                  },
                                  child: Container(
                                    margin:const EdgeInsets.only(left: 20,right: 20,top: 10,bottom:10,),
                                    child: Container(
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: AppColors.tabVarViewColor,
                                       boxShadow:[
                                         BoxShadow(
                                           blurRadius: 2,
                                           offset: Offset(0,0),
                                           color: Colors.grey.withOpacity(0.2),
                                         )
                                       ]
                                     ),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                image:DecorationImage(
                                                    image: AssetImage(books[i]["img"])
                                                )
                                                    )
                                              ),
                                            SizedBox(width: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star,size:24,color: AppColors.starColor,),
                                                    ],
                                                ),
                                                Text(books[i]["title"],style: TextStyle(fontSize: 16,fontFamily:"Avenir",fontWeight:FontWeight.bold),),
                                                Text(books[i]["text"],style: TextStyle(fontSize: 16,fontFamily:"Avenir",color:AppColors.subTitleText),),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );}
                              ),
                          Material(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                              title: Text("Content",style: TextStyle(color:Colors.black),),
                            ),
                          ),
                          Material(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                              title: Text("Content",style: TextStyle(color:Colors.black),),
                            ),
                          ),
                        ])) ),

            ],
          ),
        ),
      ),
    );
  }
}*/

