import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/notifications_screen/notifications_screen.dart';

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
      child: Column(
        children: [
          const CustomSizedBoxHeight(0.05),
          Row(
            children: [
              const CustomSizedBoxWidth(0.03),
              GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(Icons.menu, color: AppColors.whiteColor)),
              const CustomSizedBoxWidth(0.05),
              const CustomText(
                  text: 'Home',
                  fontFamily: CustomFonts.poppins,
                  size: 0.05,
                  color: AppColors.whiteColor),
              const CustomSizedBoxWidth(0.6),
              GestureDetector(
                  onTap: () {
                    PageNavigations().push(const NotificationScreen());
                  },
                  child: const Icon(Icons.notification_add,
                      color: AppColors.whiteColor)),
            ],
          ),
        ],
      ),
    );
  }
}
