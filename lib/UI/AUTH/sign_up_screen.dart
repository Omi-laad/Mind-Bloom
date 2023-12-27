import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
import 'package:fmajorproject/Widgets/round_button.dart';
import 'package:fmajorproject/utils/utils.dart';

import 'login_screen.dart';
class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading =false;

  final _formField = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void dispose(){
    // todo: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: ()async {
      SystemNavigator.pop();
      return true;
    },
        child:Scaffold(
      appBar:AppBar(
        title: Text("Signup"),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formField,child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox.fromSize(
                    size:  const Size.fromRadius(45),
                    child: Image.asset('img/App_logo.jpg',
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType:TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter Email',fillColor: Colors.white,
                      prefixIcon: Icon(Icons.alternate_email,color: Colors.white,)
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return'Enter Email';
                    }
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType:TextInputType.text,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock_open,color: Colors.white,)
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return'Enter Password';
                    }
                  },
                ),
              ],
            ), ),
            SizedBox(height: 50,),
            RoundButton(
              title:'Sign up',
             // loading: loading,
              onTap: (){
                if (_formField.currentState!.validate()){
                  setState(() {
                    loading =true;
                  });
                  _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString()).then((value){
                    setState(() {
                      loading =false;
                    });
                    utils().toastMessage(value.user!.email.toString());
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context)=>PostScreen() )
                    );
                  },).onError((error, stackTrace){
                    utils().toastMessage(error.toString());
                    setState(() {
                      loading =false;
                      
                    });
                  });
                }
              },
            ),
            SizedBox(height: 30,),
            Row(
              children: [Text("Already have an Account ?",style: TextStyle(color: Colors.white),),
                TextButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                      builder:(context)=>LoginScreen()));
                }, child: Text('Login',style: TextStyle(color: Colors.blue),))],
            ),


          ],
        ),
      ),
    ));
  }
}
