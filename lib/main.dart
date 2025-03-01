import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_first_testing/views/auth_module/sign_up2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_first_testing/views/auth_module/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Initialize Firebase for Web with the configuration options
 /* await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCK4ErKgCfpeDCPb_opE37gKVz57xFijvQ',  // Replace with actual values from Firebase Console
      authDomain: 'fir-first-testing-dc322.firebaseapp.com',
      projectId: 'fir-first-testing-dc322',
      storageBucket: 'fir-first-testing-dc322.firebasestorage.app',
      messagingSenderId: '285032167093',
      appId: '1:285032167093:web:5804789d11dff4b861b0fc',
      measurementId: 'G-GLRSGDKT5X',  // Optional
    ),
  );*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Web',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUp2()
      //SignUp(),
    );
  }
}
