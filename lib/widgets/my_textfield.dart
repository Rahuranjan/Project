import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  const MyTextField({super.key, required this.controller, required this.hintText, required this.obscureText, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade900)
                ),
                fillColor: Colors.grey.shade400,
                filled: true,
              ),
            ),
          );
  }
}