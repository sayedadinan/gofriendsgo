import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_textfields.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';

class LabeledInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon? prefixIcon;
  final String fontFamily;
  final double fontSize;
  final Color textColor;
  final int? maxlngths;
  final Icon? suffix;
  final TextEditingController? controller;
  const LabeledInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.fontFamily = 'Poppins',
    this.fontSize = 0.04,
    this.textColor = Colors.black,
    this.maxlngths,
    this.suffix,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          fontFamily: fontFamily,
          text: labelText,
          size: fontSize,
          color: textColor,
        ),
        Inputfield(
          controller: controller,
          icon: suffix,
          hinttext: hintText,
          prefixIcon: prefixIcon,
          maxLengths: maxlngths,
        ),
      ],
    );
  }
}
