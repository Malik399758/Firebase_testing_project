import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryChatScreen extends StatefulWidget {
  const HistoryChatScreen({super.key});

  @override
  State<HistoryChatScreen> createState() => _HistoryChatScreenState();
}

class _HistoryChatScreenState extends State<HistoryChatScreen> {
  Map<String, dynamic>? userData; // Variable to store user data
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection('currentUsers').doc(userId).get();

      if (userDoc.exists) {
        setState(() {
          userData = userDoc.data() as Map<String, dynamic>;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading spinner while fetching data
          : userData == null
          ? Center(child: Text("No user data found."))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'Your Info',
              style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your account details fetched from Firebase Firestore:',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          SizedBox(height: 20),

          // Display user details dynamically
          buildUserInfoBox('Email', userData!['email']),
          buildUserInfoBox('First Name', userData!['firstName']),
          buildUserInfoBox('Last Name', userData!['lastName']),
          buildUserInfoBox('Password', userData!['password']), // Not recommended for security reasons
        ],
      ),
    );
  }

  Widget buildUserInfoBox(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CupertinoColors.black),
        ),
        child: Center(
          child: Text('$label: $value', style: GoogleFonts.poppins(fontSize: 16)),
        ),
      ),
    );
  }
}
