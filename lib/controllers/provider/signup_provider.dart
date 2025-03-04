import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class SignupProvider extends ChangeNotifier{

  Future<void> signUpAccount(String email,String password)async{
    try{
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password);
      print('Account Created');
      print('User id ------------->${user.user!.uid}');
    }on FirebaseAuthException catch (e){
      print(e.message);
    }
  }
}