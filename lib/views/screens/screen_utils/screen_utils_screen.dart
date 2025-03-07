import 'package:firebase_first_testing/controllers/provider/signup_provider.dart';
import 'package:firebase_first_testing/views/components/customize_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenUtilsScreen extends StatefulWidget {
  const ScreenUtilsScreen({super.key});

  @override
  State<ScreenUtilsScreen> createState() => _ScreenUtilsScreenState();
}

class _ScreenUtilsScreenState extends State<ScreenUtilsScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Utils',style: GoogleFonts.poppins(fontSize: 22.sp,fontWeight: FontWeight.w600,color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Consumer<SignupProvider>(
            builder: (context,value,child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CupertinoColors.black,
                    ),
                  ),
                  child: Center(child: Text('First Name',style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(height: 20.h,),
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CupertinoColors.black,
                    ),
                  ),
                  child: Center(child: Text('Last Name',style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(height: 20.h,),
                Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: CupertinoColors.black,
                    ),
                  ),
                  child: Center(child: Text('Email',style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w600),)),
                ),
                SizedBox(height: 10.h,),
                Container(
                  width: 200.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: CupertinoColors.black
                  ),
                  child: Center(child: Text('Sign Up',style: GoogleFonts.poppins(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Colors.white),)),
                ),*/

                  // Customize TextField
                  /* SizedBox(height: 10.h,),
                CustomizeTextfield(hintText: 'Enter first Name', labelText: 'First Name', iconData: CupertinoIcons.person),
                SizedBox(height: 10.h,),
                CustomizeTextfield(hintText: 'Enter last Name', labelText: 'Last Name', iconData: CupertinoIcons.person),
                SizedBox(height: 10.h,),
                CustomizeTextfield(hintText: 'Enter your email', labelText: 'Email', iconData: Icons.email),*/
                  GestureDetector(
                    onTap: ()async{
                      await value.SignOutAccount();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Logout Successfully!')));
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                        child: Text('Log out?',style: GoogleFonts.poppins(
                          fontSize: 18,fontWeight: FontWeight.w500
                        ),)),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: 'Enter your email',
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        )
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Enter your password',
                        label: Text('Password'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        )
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  GestureDetector(
                    onTap: () async{
                     await value.signUpAccount(_emailController.text, _passwordController.text);
                    },
                    child: Container(
                      width: 200.h,
                      height: 40.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: CupertinoColors.black
                      ),
                      child: Center(child: Text('Sign Up', style: GoogleFonts
                          .poppins(fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),)),
                    ),
                  ),

                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
