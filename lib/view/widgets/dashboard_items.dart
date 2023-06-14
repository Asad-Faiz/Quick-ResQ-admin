import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

GestureDetector dashboardInfo(
    String txt, Function ontap, BuildContext context) {
  return GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.025,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "${txt}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    onTap: () {
      ontap();
    },
  );
}
