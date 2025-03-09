import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_flutter/icons_flutter.dart';

class SignInWithGoogleScreen extends StatefulWidget {
  const SignInWithGoogleScreen({super.key});

  @override
  State<SignInWithGoogleScreen> createState() => _SignInWithGoogleScreenState();
}

class _SignInWithGoogleScreenState extends State<SignInWithGoogleScreen> {

  // SignIn With Google
  Future<void> signInWithGoogle()async{
    try{
      // Google Sign in account
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      print('User details Email --------->${googleSignInAccount?.email}');
      print('User details Name --------->${googleSignInAccount?.displayName}');
      print('User details Name --------->${googleSignInAccount?.photoUrl}');
      // Authentication
      final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount!.authentication;

      // OAuthCredential
      final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication!.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      print('Firebase sign in successfully ------------>${userCredential}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully')));
    }catch(e){
      print('Error ------------>$e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn With Google',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: GestureDetector(
                onTap: ()async{
                  await signInWithGoogle();
                },
              child: Icon(AntDesign.google,color: Colors.red,size: 50,)))
        ],
      ),
    );
  }
}
