import 'package:firebase_first_testing/views/screens/chat_module/chatting_screen.dart';
import 'package:firebase_first_testing/views/screens/chat_module/history_chat_screen.dart';
import 'package:firebase_first_testing/views/screens/chat_module/profile_chat_screen.dart';
import 'package:firebase_first_testing/views/screens/chat_module/setting_chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenChat extends StatefulWidget {
  const HomeScreenChat({super.key});

  @override
  State<HomeScreenChat> createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  int _currentIndex = 0;
  List _pages = [
    ProfileChatScreen(),
    ChattingScreen(),
    SettingChatScreen(),
    HistoryChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.teal,
      ),*/
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index){
          setState(() {
            _currentIndex = index;
          });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.messenger),label: 'chatting'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
        BottomNavigationBarItem(icon: Icon(Icons.history),label: 'history'),
      ]),
    );
  }
}
