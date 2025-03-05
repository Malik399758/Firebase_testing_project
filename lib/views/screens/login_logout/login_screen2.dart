import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first_testing/views/screens/login_logout/home_screen2.dart';
import 'package:firebase_first_testing/views/screens/login_logout/login_and_logout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  // Login Account
  Future<void> loginAccount(String email,String password)async{
    try{
      setState(() {
        isLoading = true;
      });
      UserCredential userID = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(userID.user!.uid.isNotEmpty){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Account Successfully!')));
        print('User ID-------------------->${userID.user!.uid}');
        setState(() {
          isLoading = false;
        });
      }else{
        setState(() {
          isLoading = false;
        });
        print('User not found');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Doesn't account")));
      }

    }on FirebaseAuthException catch(e){
      setState(() {
        isLoading = false;
      });
      print('Error ------------>${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something Went Wrong!')));
    }catch(e){
      setState(() {
        isLoading = false;
      });
      print('Error ------------->$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),

            ),
            SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: ()async{
                await loginAccount(_emailController.text.trim(), _passwordController.text.trim());
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen2()));
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.black,
                ),
                child: Center(child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text('Login',style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),)),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: RichText(
                  text: TextSpan(
                      children:[
                        TextSpan(text: 'Do you want to create new account? ',style: GoogleFonts.poppins(fontSize: 14,color: CupertinoColors.black)),
                        TextSpan(text: 'Sign up',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.red))
                      ] )),
            )
          ],
        ),
      ),
    );
  }
}
