import 'package:flutter/material.dart';

Container customTextFields(
    TextEditingController datacontroller, String label, bool temp) {
  // bool isPasswordVisible = false;
  return Container(
    height: 80,
    width: 300,
    child: TextField(
      obscureText: temp,
      style: const TextStyle(color: Colors.white),
      controller: datacontroller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(),
          fillColor: const Color.fromARGB(255, 34, 73, 87),
          filled: true,
          focusColor: Colors.white),
    ),
  );
}
