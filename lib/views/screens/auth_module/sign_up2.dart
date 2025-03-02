import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_first_testing/views/screens/chat_module/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;
  bool _obscureText = true;
  bool _obscureConfirmPassword = true;
  final keyForm = GlobalKey<FormState>();

  // Collection
  Future<void> fireBaseCollection(String userid) async{
    try{
      var result = await FirebaseFirestore.instance.collection('currentUsers').doc(userid).set(
          {
            'firstName' : firstNameController.text,
            'lastName' : lastNameController.text,
            'email' : emailController.text,
            'password' : passwordController.text,
            'confirmPassword':confirmPasswordController.text,
          }
      );
      print("User saved successfully!");
    }catch(e){
      print('FireStore Error-------------------------->$e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up',style: GoogleFonts.poppins(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Account!',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600)),
                SizedBox(height: 20,),
                Container(
                  width: 300,
                  child: TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter first name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: firstNameController,
                    decoration: InputDecoration(
                      label: Text('First Name',style: GoogleFonts.poppins(),),
                      hintText: 'Enter first name',
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
                        return 'Please enter last name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: lastNameController,
                    decoration: InputDecoration(
                        label: Text('Last Name',style: GoogleFonts.poppins(),),
                        hintText: 'Enter last name',
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
                        return 'Please enter email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                        label: Text('Email',style: GoogleFonts.poppins(),),
                        hintText: 'Enter email here',
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
                    obscureText: _obscureText,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: passwordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        label: Text('Password',style: GoogleFonts.poppins(),),
                        hintText: 'Enter password here',
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
                    obscureText: _obscureConfirmPassword,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter confirm password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                            icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility)),
                        prefixIcon: Icon(Icons.lock),
                        label: Text('Confirm Password',style: GoogleFonts.poppins(),),
                        hintText: 'Enter confirm password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                // tap
                GestureDetector(
                  onTap: ()async{
                    if(keyForm.currentState!.validate()){
                      try{
                        setState(() {
                          isLoading = true;
                        });
                        if(passwordController.text != confirmPasswordController.text){
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Passwords do not match')),
                          );
                          return;
                        }
                        UserCredential response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                        print('Response ---------------->${response.user!.uid}');
                        await fireBaseCollection(response.user!.uid);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenChat()));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account created Successfully')));
                        setState(() {
                          isLoading = false;
                        });
                      }on FirebaseException catch(error){
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
                        print('FireBase error ---------------->$error');
                      }catch(e){
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
                        print('Error --------------->$e');
                      }
                    }
                  },
                  child: Container(
                    width: 180,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.teal,
                    ),
                    child: Center(child: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Text('Sign Up',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

