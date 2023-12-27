import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fmajorproject/UI/AUTH/sign_up_screen.dart';
import 'package:fmajorproject/UI/Posts_login/post_screen.dart';
import 'package:fmajorproject/Widgets/round_button.dart';
import 'package:fmajorproject/utils/utils.dart';

import '../forgot_password.dart';
class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final _formField = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController=TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose(){
    // todo: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void Login(){
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text).then((value) {
          utils().toastMessage(value.user!.email.toString());
  Navigator.push(context,
  MaterialPageRoute(builder:
      (context)=>PostScreen() )
  );

    }).onError((error,stackTrace){
      debugPrint(error.toString());
          utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          title: Text("Login"),
          backgroundColor: Colors.teal[300],
          centerTitle: true,
        ) ,
        body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: SafeArea(
            child: Center(
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
                      SizedBox(height: 16,),
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
                      SizedBox(height: 18,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType:TextInputType.text,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',

                            prefixIcon: Icon(Icons.lock_open,color: Colors.white,)
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return'Enter Password';
                          }
                        },
                      ),
                    ],
                  ),
                  ),
                 SizedBox(height: 24,),
                 RoundButton(
                   title:'Login',
                   onTap: (){
                     if (_formField.currentState!.validate()){
                       Login();
                     }
                   },
                 ),
                  SizedBox(height: 8,),
                 Align(
                   alignment: Alignment.bottomRight,
                   child: TextButton(
                       onPressed:(){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));
                       },
                       child: Text("Forgot Password ?")
                   ),
                 ),

                  SizedBox(height: 20,),
                  Row(
                    children: [Text("Not a Member ?",style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> SignupScreen()));
                    }, child: Text('Sign up',style: TextStyle(color: Colors.blue),))],
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
