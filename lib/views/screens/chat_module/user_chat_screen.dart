import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  const UserChatScreen({super.key,required this.name,required this.imageUrl});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                Icon(Icons.arrow_back,),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundImage: AssetImage(widget.imageUrl),
                ),
                SizedBox(width: 10,),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: '${widget.name}\n',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,color: CupertinoColors.black)),
                      TextSpan(text: 'Online',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w500,color: CupertinoColors.black)),
                    ]
                )),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              width: 320,
              height: 82,
              decoration: BoxDecoration(
                  color: Color(0xFFEEF0F2),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 7),
                child: Text('This is description, This is description,\n'
                    'This is\n'
                    'description,\n'
                    'Make sure your message looks like this.',style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w600),),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 307.19,
              height: 49,
              decoration: BoxDecoration(
                  color: Color(0xFFEEF0F2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
              ),
              child: Padding(
                  padding: const EdgeInsets.only(left: 20,top: 7),
                  child: Text('Lorem ipsum dolor sit amet ?',style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400),)
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 308.13,
                height: 113.08,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)
                    )
                ),
                child: Center(child: Text('Sed et sem a massa maximus\nvulputate. Curabitur a lorem aliquet,\ntempor lorem a, dictum ex.',
                  style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 250,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFFEEF0F2),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                ),
              ),
              child: Center(child: Text('Sure, sending it right now...',style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400),)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 260,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFEEF0F2),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.emoji_emotions_outlined),
                        ),
                        SizedBox(width: 5,),
                        Text('Type message...',style: GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.telegram,size: 40,)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
