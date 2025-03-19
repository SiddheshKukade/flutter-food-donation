import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapk/main.dart';
import 'package:flutterapk/reusable_widget/reusable_widget.dart';
import 'package:flutterapk/screens/choose_user.dart';
import 'package:flutterapk/screens/home_screen.dart';
import 'package:flutterapk/screens/reset_screen.dart';
import 'package:flutterapk/screens/signup_screen.dart';
import 'package:flutterapk/screens/utils/color_utils.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
TextEditingController _passwordTextController=TextEditingController();
TextEditingController _emailTextController=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,


      
      
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
      hexStringToColor("CB2B93"),
      hexStringToColor("9546C4"),
      hexStringToColor("5E61F4")
      
      ],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
      child:SingleChildScrollView(
        child: Padding(
          
          padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.2, 20, 0),
          
          child: Column(
            children: <Widget>[
                logoWidget("assets/images/logo1.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                  const SizedBox(
                  height: 5,
                ),
                forgetpassword(context),
                firebaseButton(context, "Sign In", (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>chooseUser()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                  
                }),
                signUpOption()
            ],
          ),), ),


      ),);
  }

  Row signUpOption()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
        style: TextStyle(color: Colors.white70),),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
            
          },
          child: const Text("Sign Up",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }


Widget forgetpassword(BuildContext context)
{
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton( child: const Text("Forget Password?",
    style: TextStyle(color: Colors.white70),
    textAlign: TextAlign.right,

    ),
    onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword())),
    ),
  );
}
  
}