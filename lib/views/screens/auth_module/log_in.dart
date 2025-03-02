import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first_testing/views/screens/auth_module/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: formKey,
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
                  if(formKey.currentState!.validate()){
                    setState(() {
                      isLoading = true;
                    });
                    try{
                     final response =  await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim());
                     if(response.user != null){
                       print('Response -----------------> ${response.user}');
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User already exists!')));
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                       setState(() {
                         isLoading = false;
                       });
                     }else{
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User doesn't exists!")));
                       setState(() {
                         isLoading = false;
                       });
                     }

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
                  child: Center(child: isLoading ? CircularProgressIndicator(color: Colors.white,) : Text('Login',style:GoogleFonts.poppins(color: Colors.white,fontSize:16,fontWeight: FontWeight.w600),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
