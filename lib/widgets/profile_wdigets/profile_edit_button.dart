import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class ProfilepageeEditbutton extends StatelessWidget {
  const ProfilepageeEditbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        width: mediaquerywidth(0.18, context),
        height: mediaqueryheight(0.03, context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(06),
            gradient: const LinearGradient(colors: AppColors.gradientColors)),
        child: Center(
          child: Row(
            children: [
              const CustomSizedBoxWidth(0.04),
              const CustomText(
                  text: 'edit',
                  fontFamily: CustomFonts.roboto,
                  size: 0.03,
                  color: AppColors.whiteColor),
              const CustomSizedBoxWidth(0.02),
              Icon(Icons.edit,
                  color: AppColors.whiteColor,
                  size: mediaquerywidth(0.03, context))
            ],
          ),
        ),
      )
    ]);
  }
}
