import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first_testing/views/screens/auth_module/home_screen.dart';
import 'package:firebase_first_testing/views/screens/auth_module/log_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.green,
      ),
      body:Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your email';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 300,
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter your password';
                    }else if(value.length < 6){
                      return ' Password should be at least 6 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      label: Text('Password'),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                if(_formKey.currentState!.validate()){
                  setState(() {
                    isLoading = true;
                  });
                  try{
                    UserCredential response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());
                    if(response.user != null){
                      print('Response ---------------->${response.user!.uid}');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Already exists!')));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      print('Response ---------------->$response');
                      setState(() {
                        isLoading = false;
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account created Successfully!!')));
                  }on FirebaseException catch (error){
                    print('error------------------------->$error');
                    setState(() {
                      isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
                  }finally{
                    setState(() {
                      isLoading = false;
                    });
                  }
                }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal
                  ),
                  child: Center(child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text('Sign Up',style:GoogleFonts.poppins(color: Colors.white,fontSize:16,fontWeight: FontWeight.w600),)),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                },
                child: RichText(
                    text: TextSpan(
                    children: [
                    TextSpan(text: ' Do you have an account? ',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black87)),
                    TextSpan(text: "Login",style: GoogleFonts.poppins(fontWeight:FontWeight.w600,fontSize: 17,color: Colors.red ))
                  ]
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
