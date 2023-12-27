import 'package:flutter/material.dart';
import 'package:fmajorproject/UI/Posts_login/quotes_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart'as dom;
import 'package:html/parser.dart' as parser;

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
List<String> categories =["inspirational","life","truth","books","reading","humor","friendship","friends"];
List quotes =[];
List authors = [];

bool isDatathere = false;
@override
void initState(){
  super.initState();
  getquotes();
}
getquotes()async{
  String url = "https://quotes.toscrape.com/";
  Uri uri = Uri.parse(url);
  http.Response response = await http.get(uri);
  dom.Document document= parser.parse(response.body) as dom.Document;
  final quotesclass = document.getElementsByClassName("quote");

  quotes = quotesclass
      .map((element) =>element.getElementsByClassName('text')[0].innerHtml).toList();
  authors =quotesclass
      .map((element) =>element.getElementsByClassName('author')[0].innerHtml).toList();
  print(authors);
  setState(() {
    isDatathere = true;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
                alignment:Alignment.center,
                margin: EdgeInsets.only(top:20),
        child: Text("Inspire yourself".toUpperCase(),style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white))),
            GridView.count(
              crossAxisCount: 4,
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: categories.map((category){
              return InkWell(
                onTap:(){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>QuotesPage(categoryname: category),
                      ));
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                      color: Colors.teal[300],
                      borderRadius:BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(category.toUpperCase(),
                      style:TextStyle(
                        fontSize: 10,
                        color: Colors.white,fontWeight: FontWeight.w700,
                      ),),
                    ),
                  ),
                ),
              );
            }).toList()),

            SizedBox(height: 20,),
           isDatathere == false
            ?Center(child: CircularProgressIndicator(),)
           : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: quotes.length,
                itemBuilder: (context,index){
                  return Container(

                    padding: EdgeInsets.all(10),
                    child: Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20.0,bottom: 20.0,left: 20.0,),
                            child: Text(quotes[index],style:TextStyle(fontSize:18,color: Colors.black,fontWeight:FontWeight.w700 ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(authors[index],style:TextStyle(fontSize:15,color: Colors.black,fontWeight:FontWeight.w700 ),),
                          ),
                        ],
                      ),
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
