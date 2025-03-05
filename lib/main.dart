import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_first_testing/controllers/provider/signup_provider.dart';
import 'package:firebase_first_testing/views/screens/auth_module/home_screen.dart';
import 'package:firebase_first_testing/views/screens/auth_module/sign_up2.dart';
import 'package:firebase_first_testing/views/screens/chat_module/home_screen.dart';
import 'package:firebase_first_testing/views/screens/login_logout/login_and_logout.dart';
import 'package:firebase_first_testing/views/screens/screen_utils/screen_utils_screen.dart';
import 'package:firebase_first_testing/views/screens/splash_screen/chat_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SignupProvider())
    ],
        child: MyApp()),
    );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Web',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:LoginAndLogout()
        //ScreenUtilsScreen()
        //ChatSplashScreen(),
        //SignUp2(),
        //HomeScreenChat()
        //SignUp2()
        //SignUp(),
      ),
    );
  }
}
