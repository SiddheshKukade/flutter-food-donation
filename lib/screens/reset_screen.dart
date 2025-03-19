 import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapk/main.dart';
import 'package:flutterapk/reusable_widget/reusable_widget.dart';
import 'package:flutterapk/screens/home_screen.dart';
import 'package:flutterapk/screens/utils/color_utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
TextEditingController _emailTextController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Reset Password",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
        
      ),



      body: Container(width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      hexStringToColor("CB2B93"),
      hexStringToColor("9546C4"),
      hexStringToColor("5E61F4")
      
      ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
      child: Padding(padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
      child: Column(
        children: <Widget>[
       
                    SizedBox(
                  height: 30,
                ),
          reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
                    SizedBox(
                  height: 20,
                ),
          firebaseButton(context, "Reset Password", (){
            FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text).then((value) =>Navigator.of(context));

          })
  

        ],
      ),
      
      ),
      
      ),
        
      );
    
  }
}