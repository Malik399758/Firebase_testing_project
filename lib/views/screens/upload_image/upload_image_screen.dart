import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  File? _image;
  final picker = ImagePicker();

  // Pick Image from gallery
  Future<void> imagePickFromGallery()async{
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      setState(() {
        _image = File(pickedImage.path);
      });
    }else{
      print('No Image selected');
    }

  }

  // Upload Image to Firebase Storage
  /*Future<String?> uploadImageOnServer(String uid) async {
    if (_image == null) return null;

    try {
      String fileName = "images/$uid-${DateTime.now().millisecondsSinceEpoch}.jpg";
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint('Error Uploading Image: $e');
      return null;
    }
  }*/

  // Upload image to Firebase

  Future<String?> imageUploadOnFirebase(String userId)async{
    if(_image == null) return null;
    try{
      Reference ref = await FirebaseStorage.instance.ref().child('ImageFolder/$userId.jpg');

      print('Reference --------------->${ref.fullPath}');
      UploadTask uploadTask = ref.putFile(_image!);

      print('UploadTask ----------------->$uploadTask');
      TaskSnapshot taskSnapshot = await uploadTask;

      final DownloadUrl = await ref.getDownloadURL();
      print('DownloadUrl ------------->${DownloadUrl.toString()}');
      return DownloadUrl;
    }catch(e){
      print('Error ------------->$e');
    }


  }

  // Upload User Info to Firestore
  Future<void> uploadUserInfo(String userId, String? imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'firstName': _firstName.text,
        'lastName': _lastName.text,
        'email': _emailController.text,
        'imageUrl': imageUrl,
      });
    } catch (e) {
      debugPrint('Firestore Error: $e');
    }
  }

  // Sign Up Function
  Future<void> signUpUser() async {
    if (_firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    setState(() => isLoading = true);
    try {
      UserCredential userResponse = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      String? imageUrl = await imageUploadOnFirebase(userResponse.user!.uid,);
      await uploadUserInfo(userResponse.user!.uid, imageUrl);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Created Successfully')),
      );
    } catch (e) {
      debugPrint('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Image',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const AssetImage('assets/images/user_profile_image.png') as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 3,
                    child: GestureDetector(
                      onTap: imagePickFromGallery,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
                        child: const Icon(Icons.edit, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Yaseen Malik', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 15),
              _buildTextField('First Name', _firstName),
              const SizedBox(height: 15),
              _buildTextField('Last Name', _lastName),
              const SizedBox(height: 15),
              _buildTextField('Email', _emailController),
              const SizedBox(height: 15),
              _buildTextField('Password', _passwordController, obscureText: true),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator(color: Colors.teal)
                  : ElevatedButton(
                onPressed: signUpUser,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500)),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
