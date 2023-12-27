import 'package:flutter/material.dart';
import 'package:fmajorproject/UI/Posts_login/Home_listview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart'as dom;
import 'package:html/parser.dart' as parser;
class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key, required this.categoryname}) : super(key: key);
  final String categoryname;


  @override
  State<QuotesPage> createState() => _QuotesPageState();
}
class _QuotesPageState extends State<QuotesPage> {
  List quotes =[];
  List authors = [];
  bool isDatathere = false;
  @override
  void initState(){
    super.initState();
    getquotes();}
  getquotes()async{
String url = "https://quotes.toscrape.com/tag/${widget.categoryname}/";
Uri uri = Uri.parse(url);
  http.Response response = await http.get(uri);
  dom.Document document= parser.parse(response.body);
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
      backgroundColor:Colors.black,
      appBar: AppBar(
        centerTitle: true,
         title:Container(
             margin: EdgeInsets.only(top:10),child: Text("${widget.categoryname} Quotes".toUpperCase(),style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.teal,
        elevation: 0.0,
      leading:  IconButton(onPressed: (){
      Navigator.pop(context,
          MaterialPageRoute(builder: (context)=>Feed(),
          )
      );
    },icon:Icon(Icons.arrow_back_ios),color:Colors.white,
      ),
      ),
      body:isDatathere == false
          ?Center(child:
      CircularProgressIndicator())
      :SingleChildScrollView(
        physics: ScrollPhysics(),
        child:
        Column(
          children: [/*Container(
              alignment:Alignment.center,
              margin: EdgeInsets.only(top:60),
              child: Text("${widget.categoryname} Quotes".toUpperCase())
          ),*/
            ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: quotes.length,
                itemBuilder: (context,index){
                return Container(
                  color: Colors.black,
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
