import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class DrawerCircleAvatar extends StatelessWidget {
  const DrawerCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: AppColors.gradientColors)),
      child: const CustomText(
        text: "PR",
        fontFamily: CustomFonts.roboto,
        size: 0.05,
        color: AppColors.whiteColor,
        weight: FontWeight.w600,
      ),
    );
  }
}
