import 'package:flutter/material.dart';
import 'package:pms_manager/utils/colors.dart';

import '../styles.dart';

class LanguageRadioRow extends StatelessWidget {
  const LanguageRadioRow({
    super.key,
    required this.onChanged,
    required this.text,
    required this.groupValue,
    required this.value,
    this.color,
    this.textColor,
  });
  final void Function(dynamic)? onChanged;
  final String text;
  final dynamic groupValue;
  final dynamic value;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return RadioListTile<dynamic>(
      contentPadding: EdgeInsets.all(0),
      activeColor: color ?? Colors.white,
      value: value,
      groupValue: groupValue,
      secondary: SizedBox(
        width: 260,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 17,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
      toggleable: true,
      onChanged: onChanged,
    );
  }
}
