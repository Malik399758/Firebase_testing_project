import 'dart:async';

import 'package:firebase_first_testing/views/screens/auth_module/sign_up2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatSplashScreen extends StatefulWidget {
  const ChatSplashScreen({super.key});

  @override
  State<ChatSplashScreen> createState() => _ChatSplashScreenState();
}

class _ChatSplashScreenState extends State<ChatSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp2()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/chat_logo1.png',height: 180,),
            SizedBox(height: 20,),
            Text('Chat App',style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w600,color: CupertinoColors.white),),
            SizedBox(height: 20,),
            SpinKitSquareCircle(
              color: CupertinoColors.white,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
