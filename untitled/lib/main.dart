import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/home.dart';
import 'package:untitled/otppage.dart';
import 'package:untitled/otpverify.dart';
import 'package:untitled/signup.dart';
import 'package:untitled/login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup': (context) => SignUp(),
        '/login': (context) => Login(),
        '/OtpVerify':(context)=>OtpVerify(),
        '/OtpPage':(context)=>OtpPage(),
      },
      home: Home()
    );
  }
}
