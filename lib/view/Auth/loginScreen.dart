// import 'dart:developer';

import 'package:adminpannel/controller/auth_Controller.dart';
// import 'package:adminpannel/view/Dashboard/Dashboard.dart';
import 'package:adminpannel/view/widgets/custom_textfields.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    // bool _showeye = false;
    // bool _passwordEncrypte = true;

    // var sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(9, 53, 69, 1),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 45, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Sign in and start managing",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),

          // custom text fields
          customTextFields(emailController, "Enter Email", false),

          const SizedBox(
            height: 20,
          ),
          // we are not going to use custom text field instead

          customTextFields(passwordController, "Enter Password", true),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                AuthController()
                    .login(emailController, passwordController, context);
                setState(() {
                  isTrue = true;
                });
              },
              child: (isTrue == false)
                  ? Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )
                  : CircularProgressIndicator(),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Set the rounded border radius
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
