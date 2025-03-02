import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingChatScreen extends StatefulWidget {
  const SettingChatScreen({super.key});

  @override
  State<SettingChatScreen> createState() => _SettingChatScreenState();
}

class _SettingChatScreenState extends State<SettingChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                Icon(Icons.arrow_back_outlined),
                SizedBox(width: 100,),
                Text('Settings',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 3,left: 6),
              child: Row(
                children: [
                  Icon(Icons.search_off_rounded),
                  SizedBox(width: 5,),
                  Text('Search for a setting...',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          ReuseWidget(title: 'Account', iconFirst: CupertinoIcons.person, iconSecond:Icons.arrow_forward_ios_sharp),
          Divider(),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Notifications', iconFirst: Icons.notifications_active_outlined, iconSecond:Icons.arrow_forward_ios_sharp),
          Divider(),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Appearance', iconFirst: Icons.visibility, iconSecond:Icons.arrow_forward_ios_sharp),
          Divider(),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Privacy & Security', iconFirst: CupertinoIcons.lock, iconSecond:Icons.arrow_forward_ios_sharp),
          Divider(),
          SizedBox(height: 15,),
          ReuseWidget(title: 'Help', iconFirst: Icons.help, iconSecond:Icons.arrow_forward_ios_sharp),
          Divider(),
          SizedBox(height: 15,),
          ReuseWidget(title: 'About', iconFirst: Icons.help_center_outlined, iconSecond:Icons.arrow_forward_ios_sharp),
          Divider(),
        ],
      ),
    );
  }
}
// ReuseAble Widget
class ReuseWidget extends StatelessWidget {
  String title;
  final IconData iconFirst;
  final IconData iconSecond;
  ReuseWidget({super.key,required this.title,required this.iconFirst,required this.iconSecond});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Icon(iconFirst,size: 30,),
              SizedBox(width: 10,),
              Text(title,style: GoogleFonts.poppins(fontSize: 18),),
            ],
          ),
        ),
        Icon(iconSecond,size: 20,),
      ],
    );
  }
}
