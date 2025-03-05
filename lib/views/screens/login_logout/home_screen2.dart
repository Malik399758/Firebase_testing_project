import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool isLoading = false;
  Future<void> logoutAccount()async{
    try{
      User? user = FirebaseAuth.instance.currentUser;
      if(user != null){
        await FirebaseAuth.instance.currentUser?.delete();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Logged out!')));
        print('Deleted ------------>${user.email}');
      }else{
        print('User not exists!');
      }

    }on FirebaseAuthException catch(e){
      print('Error ---------------------->${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Log out failed')));
    }
  }

  // Dialog
  Future<void> LogOutDialog()async{
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Log out',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
            content:Text('Do you want to log out this account?',style: GoogleFonts.poppins(fontSize: 15,),),
            actions: [
              ElevatedButton(onPressed: ()async{
                await logoutAccount();
                Navigator.pop(context);
              },
                  child: Text('Log out',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600),)),
              TextButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text('No',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600),))
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                LogOutDialog();
              },
                child: Icon(Icons.login,size: 30,color: CupertinoColors.white,)),
          ),
        ],
        title: Text('Home Screen',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
