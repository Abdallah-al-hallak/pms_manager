import 'package:flutter/material.dart';
import 'package:pms_manager/features/intro/widgets/custom_text.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(width ?? 50, height ?? 30)),
      onPressed: onPressed,
      child: CustomText(
        text: text,
      ),
    );
  }
}
