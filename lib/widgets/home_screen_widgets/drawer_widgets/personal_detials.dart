import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: "Puneet Rajkumar",
            fontFamily: CustomFonts.poppins,
            size: 0.040,
            weight: FontWeight.w600,
            color: AppColors.blackColor),
        CustomText(
            text: "9384747473",
            fontFamily: CustomFonts.poppins,
            size: 0.035,
            color: Color.fromRGBO(20, 20, 20, .6)),
        CustomText(
            text: "example23@gmail.com",
            fontFamily: CustomFonts.poppins,
            size: 0.035,
            color: Color.fromRGBO(20, 20, 20, .6)),
      ],
    );
  }
}
