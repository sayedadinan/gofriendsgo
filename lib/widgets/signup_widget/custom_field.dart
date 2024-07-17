import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_textfields.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';

class LabeledInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final String fontFamily;
  final double fontSize;
  final Color textColor;

  const LabeledInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.fontFamily = 'Poppins',
    this.fontSize = 0.04,
    this.textColor = Colors.black,
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
          hinttext: hintText,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
