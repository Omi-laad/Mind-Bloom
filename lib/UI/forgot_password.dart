
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fmajorproject/Widgets/round_button.dart';
import 'package:flutter/cupertino.dart';

import '../utils/utils.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 final emailController =TextEditingController();
 final auth = FirebaseAuth.instance;
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(height: 28,),
TextFormField(
  controller: emailController,
  decoration: InputDecoration(
    hintText: 'Email'
  ),
),
            SizedBox(height: 40,),
            RoundButton(title: 'Forgot', onTap:(){
              auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                utils().toastMessage(
                    'We have sent you an email to recover,Please check email!');

              }).onError((error, stackTrace){
                utils().toastMessage(error.toString());
              });
            })
          ],
        ),
      ),
    );
  }
}
