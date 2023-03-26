import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_text.dart';

import '../../../utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
  });
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, p1) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: gold,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
              width ?? p1.maxWidth / 1.0,
              height ?? p1.maxWidth / 7,
            )),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: Colors.white,
        ),
      );
    });
  }
}
