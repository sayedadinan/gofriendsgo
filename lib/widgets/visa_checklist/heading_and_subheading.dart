import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';


class VisaChecklistSubHeading extends StatelessWidget {
  const VisaChecklistSubHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomText(
      text: "Visa for Singapore",
      fontFamily: CustomFonts.lato,
      size: 0.05,
      color: AppColors.blackColor,
      weight: FontWeight.w500,
    );
  }
}

class VisaRequirementHeading extends StatelessWidget {
  const VisaRequirementHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomText(
        text: TextStrings.visaRequirement,
        fontFamily: CustomFonts.roboto,
        size: 0.06,
        color: AppColors.blackColor);
  }
}
