import 'package:flutter/material.dart';

import '../styles.dart';

class LanguageRadioRow extends StatelessWidget {
  const LanguageRadioRow({
    super.key,
    required this.onChanged,
    required this.text,
    required this.groupValue,
    required this.value,
    this.color,
  });
  final void Function(dynamic)? onChanged;
  final String text;
  final dynamic groupValue;
  final dynamic value;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: RadioListTile<dynamic>(
        activeColor: color ?? Colors.white,
        value: value,
        groupValue: groupValue,
        secondary: Text(
          text,
          style: standardTextStyle(),
        ),
        toggleable: true,
        onChanged: onChanged,
      ),
    );
  }
}
