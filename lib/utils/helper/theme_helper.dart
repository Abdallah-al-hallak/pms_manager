import 'package:flutter/material.dart';
import 'package:pms_manager/utils/colors.dart';

class ThemeHelper{

  InputDecoration textInputDecoration([String lableText="", String hintText = "", suffixIcon]){
    return InputDecoration(
      labelStyle: TextStyle(color: textGrey),
      hintStyle: TextStyle(color: gold),
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.white,
      suffixIcon: suffixIcon,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: BorderSide(color: Colors.white)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: BorderSide(color: Colors.white)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  BoxDecoration inputBoxDecorationShadow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

}