import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeTextfield extends StatefulWidget {
  String hintText;
  String labelText;
  final IconData iconData;
  CustomizeTextfield({super.key,required this.hintText,required this.labelText,required this.iconData});

  @override
  State<CustomizeTextfield> createState() => _CustomizeTextfieldState();
}

class _CustomizeTextfieldState extends State<CustomizeTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: GoogleFonts.poppins(color: Colors.green),
        hintText: widget.hintText,
        label: Text(widget.labelText,style: GoogleFonts.poppins(color: Colors.green),),
         prefixIcon: Icon(widget.iconData,color: Colors.green,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }
}
