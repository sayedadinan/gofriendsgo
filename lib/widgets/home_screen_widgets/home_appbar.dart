import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.18, context),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: AppColors.gradientColors,
      )),
      child: const Column(
        children: [
          CustomSizedBoxHeight(0.05),
          Row(
            children: [
              CustomSizedBoxWidth(0.03),
              Icon(Icons.menu, color: AppColors.whiteColor),
              CustomSizedBoxWidth(0.05),
              CustomText(
                  text: 'Home',
                  fontFamily: CustomFonts.poppins,
                  size: 0.05,
                  color: AppColors.whiteColor),
              CustomSizedBoxWidth(0.6),
              Icon(Icons.notification_add, color: AppColors.whiteColor),
            ],
          ),
        ],
      ),
    );
  }
}
