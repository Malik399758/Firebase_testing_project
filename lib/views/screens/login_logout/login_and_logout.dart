import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first_testing/views/screens/login_logout/home_screen2.dart';
import 'package:firebase_first_testing/views/screens/login_logout/login_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginAndLogout extends StatefulWidget {
  const LoginAndLogout({super.key});

  @override
  State<LoginAndLogout> createState() => _LoginAndLogoutState();
}

class _LoginAndLogoutState extends State<LoginAndLogout> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  // Create Account
  Future<void> createAccount(String email,String password)async{
    try{
      setState(() {
        isLoading = true;
      });
      UserCredential userID = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created Successfully!')));
      print('User ID-------------------->${userID.user!.uid}');
      setState(() {
        isLoading = false;
      });
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
        title: Text('Sign Up',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
                 await createAccount(_emailController.text.trim(), _passwordController.text.trim());
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen2()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.black,
                  ),
                  child: Center(child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text('Sign Up',style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white),)),
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen2()));
                },
                child: RichText(
                    text: TextSpan(
                    children:[
                      TextSpan(text: 'Do you have any account? ',style: GoogleFonts.poppins(fontSize: 16,color: CupertinoColors.black)),
                      TextSpan(text: 'Login',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.red))
                    ] )),
              ),
              // Lottie.asset('assets/images/Lottie Lego.json')
              
            ],
          
          ),
        ),
      ),
    );

  }
}
