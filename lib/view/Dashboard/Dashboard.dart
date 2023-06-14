// import 'dart:developer';

import 'package:adminpannel/controller/dashboard_Controller.dart';
// import 'package:adminpannel/controller/emergency_request_controller.dart';
import 'package:adminpannel/view/Auth/loginScreen.dart';
import 'package:adminpannel/view/widgets/dashboard_items.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../model/EmergencyRequestModel.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  // final EmergencyController request = EmergencyController();
  List<EmergencyRequestModel> requestList = [];
  String? selectedOption;
  List<String> dropdownOptions = ['pending', 'arriving', 'closed'];
  bool isButton1Clicked = false;
  bool isButton2Clicked = false;
  bool defaultval = true;
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    // Redirect to the login page or any other page as desired
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const LoginScreen()));
  }

  void onButton1Clicked() {
    setState(() {
      isButton1Clicked = true;
      isButton2Clicked = false;
    });
  }

  void onButton2Clicked() {
    setState(() {
      isButton1Clicked = false;
      isButton2Clicked = true;
      defaultval = false;
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            height: double.infinity,
            width: 200,
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Quick ResQ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    dashboardInfo(
                        "User Information", onButton1Clicked, context),
                    const SizedBox(
                      height: 30,
                    ),
                    dashboardInfo("Feed Back", onButton2Clicked, context),
                    const SizedBox(
                      height: 20,
                    ),
                    Spacer(),
                    dashboardInfo("Logout", logout, context),

                    // dashboardInfo("Notification"),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            ),
          ),

// side menu ends here
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              // information screen
// here we wll place if condition

              if (defaultval || isButton1Clicked) ...{
                DashBoardController()
                    .infoMethod(context, dropdownOptions, selectedOption),
              } else if (isButton2Clicked) ...{
                DashBoardController().feedbackScreenMethod(context)
              },
              //  feedback screen
            ],
          ),
        ],
      ),
    );
  }
}
