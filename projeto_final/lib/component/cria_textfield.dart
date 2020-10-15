import 'package:flutter/material.dart';

Widget criaTextField(String label, TextEditingController controle,
    TextInputType textInputType, IconData icon) {
  return TextField(
    controller: controle,
    decoration: InputDecoration(
        icon: Icon(icon, color: Colors.black),
        hintText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black))),
    style: TextStyle(color: Colors.black, fontSize: 15.0),
    keyboardType: textInputType,
  );
}
