import 'package:flutter/material.dart';
import 'package:pms_manager/utils/colors.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        // width: ,
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: gold),
                borderRadius: BorderRadius.circular(9.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(color: gold),
              ),
              fillColor: gold,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))),
        ),
      ),
    );
  }
}
