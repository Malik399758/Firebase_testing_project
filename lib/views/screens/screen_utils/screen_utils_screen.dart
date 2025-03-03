import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenUtilsScreen extends StatefulWidget {
  const ScreenUtilsScreen({super.key});

  @override
  State<ScreenUtilsScreen> createState() => _ScreenUtilsScreenState();
}

class _ScreenUtilsScreenState extends State<ScreenUtilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Utils',style: GoogleFonts.poppins(fontSize: 22.sp,fontWeight: FontWeight.w600,color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
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
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CupertinoColors.black
              ),
              child: Center(child: Text('Sign Up',style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
