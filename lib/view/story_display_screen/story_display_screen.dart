import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';

class StoryDisplayScreen extends StatefulWidget {
  const StoryDisplayScreen({super.key});

  @override
  State<StoryDisplayScreen> createState() => _StoryDisplayScreenState();
}

class _StoryDisplayScreenState extends State<StoryDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: AppColors.gradientColors),
            ),
            child: Column(
              children: [
                CustomSizedBoxHeight(0.06),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaquerywidth(0.05, context)),
                  child: Row(
                    children: [
                      Container(
                        width: mediaquerywidth(0.1, context),
                        height: mediaquerywidth(0.1, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.whiteColor, width: 2),
                        ),
                      ),
                      CustomSizedBoxWidth(0.03),
                      CustomText(
                        text: "David",
                        fontFamily: CustomFonts.roboto,
                        size: 0.055,
                        color: AppColors.whiteColor,
                        weight: FontWeight.w500,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => PageNavigations().pop,
                        child: Icon(
                          size: mediaquerywidth(0.08, context),
                          Icons.close,
                          color: AppColors.whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          body: Container(width: double.infinity,height: mediaqueryheight(1, context),),
    );
  }
}
