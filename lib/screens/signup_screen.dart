import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapk/main.dart';
import 'package:flutterapk/reusable_widget/reusable_widget.dart';
import 'package:flutterapk/screens/choose_user.dart';
import 'package:flutterapk/screens/home_screen.dart';
import 'package:flutterapk/screens/utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  TextEditingController _passwordTextController=TextEditingController();
TextEditingController _userNameTextController=TextEditingController();
TextEditingController _emailTextController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
        
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
          reusableTextField("Enter Username", Icons.person_outline, false, _userNameTextController),
                    SizedBox(
                  height: 30,
                ),
          reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
                    SizedBox(
                  height: 30,
                ),
          
          reusableTextField("Enter Password", Icons.lock_outline, false, _passwordTextController),
          const SizedBox(
            height: 20,

          ),
          firebaseButton(context, "Sign Up", () {
            FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,password:_passwordTextController.text).then((value){
                print("Account created Successfully");
                Navigator.push(context,MaterialPageRoute(builder: (context)=> chooseUser()));

            }).onError((error,stackTrace){
              print("Error ${error.toString()}");
            });
            
          })

        ],
      ),
      
      ),
      
      ),
        
      );
    
  }
}