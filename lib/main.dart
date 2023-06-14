import 'package:adminpannel/view/Auth/loginScreen.dart';
import 'package:adminpannel/view/Dashboard/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDV5gMSgOaYygOIcurpmpGFpVoj9OR4x-k",
          appId: "1:715732356807:web:af467bb8df11240a8fb8e2",
          messagingSenderId: "715732356807",
          projectId: "rescueapp-4a765"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null)
          ? DashBoardScreen()
          : LoginScreen(),
    );
  }
}
