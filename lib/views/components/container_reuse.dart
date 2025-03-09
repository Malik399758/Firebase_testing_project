import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerReuse extends StatefulWidget {
  final String text;
  Color color;
  ContainerReuse({super.key,required this.text,required this.color});

  @override
  State<ContainerReuse> createState() => _ContainerReuseState();
}

class _ContainerReuseState extends State<ContainerReuse> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
      ),
      child: Center(child: Text(widget.text,style: GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)),
    );
  }
}
