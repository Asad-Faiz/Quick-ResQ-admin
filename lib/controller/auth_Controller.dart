import 'dart:developer';
import 'package:get/get.dart';
import 'package:adminpannel/view/Dashboard/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  void login(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email == '' || password == '') {
      log("Filled All Input Fields");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (context) => const DashBoardScreen()));
        }
      } on FirebaseAuthException catch (e) {
        log(e.code.toString());
      }
    }
  }
}
