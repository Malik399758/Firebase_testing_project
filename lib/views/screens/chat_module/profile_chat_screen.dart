import 'package:firebase_first_testing/views/components/reuse_icon_and_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileChatScreen extends StatefulWidget {
  const ProfileChatScreen({super.key});

  @override
  State<ProfileChatScreen> createState() => _ProfileChatScreenState();
}

class _ProfileChatScreenState extends State<ProfileChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text('Profile',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600)),
          ),
          Container(
            width: double.infinity,
            height: 230,
            child: Column(
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/y.jpg'),
                  radius: 30,
                ),
                SizedBox(height: 10,),
                Text('Yaseen Malik',style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w700),),
                Text('ym399758@gmail.com',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text('PRO',style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white),)),
                      ),
                      Text('Buy Lesson Time',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,)
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(indent: 20,endIndent: 20,),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Edit Profile', icon: CupertinoIcons.person),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Notifications', icon: Icons.notifications_active_outlined),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Messages', icon: Icons.message_outlined),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Free minutes', icon: Icons.free_cancellation_outlined),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Favorite Tutors', icon: Icons.favorite_border),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Schedule lesson', icon: Icons.schedule),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Contact', icon: Icons.contact_mail_outlined),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Logout', icon: Icons.login),
        ],
      ),
    );
  }
}
class ReuseWidget extends StatelessWidget {
  String title;
  IconData icon;
  ReuseWidget({super.key,required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 30,),
        SizedBox(width: 20,),
        Text(title,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
      ],
    );
  }
}
