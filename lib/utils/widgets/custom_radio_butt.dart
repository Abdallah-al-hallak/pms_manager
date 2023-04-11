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
    this.width,
    this.textAlign,
  });
  final void Function(dynamic)? onChanged;
  final String text;
  final dynamic groupValue;
  final dynamic value;
  final Color? color;
  final double? width;
  final TextAlign? textAlign;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, p1) {
      return RadioListTile<dynamic>(
        visualDensity: const VisualDensity(
          vertical: -3,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        activeColor: color ?? Colors.white,
        value: value,
        groupValue: groupValue,
        secondary: SizedBox(
          width: 200,
          child: Text(
            text,
            textAlign: textAlign ?? TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              color: textColor ?? Colors.white,
              fontFamily: 'Helvetica',
            ),
          ),
        ),
        toggleable: true,
        onChanged: onChanged,
      );
    });
  }
}
