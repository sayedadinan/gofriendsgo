import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class GridViewMeetTheTeam extends StatelessWidget {
  const GridViewMeetTheTeam({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: mediaqueryheight(0.19, context),
          mainAxisSpacing: mediaqueryheight(0.025, context),
          crossAxisSpacing: mediaquerywidth(0.05, context),
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8)),
            width: mediaquerywidth(0.24, context),
            child: Column(
              children: [
                Container(
                  width: mediaquerywidth(0.2, context),
                  height: mediaqueryheight(0.1, context),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://personalexcellence.co/files/ceo.jpg"))),
                ),
                const CustomSizedBoxHeight(0.008),
                const CustomText(
                    text: "Devon Lane",
                    fontFamily: CustomFonts.roboto,
                    size: 0.035,
                    weight: FontWeight.w500,
                    color: Color.fromRGBO(39, 39, 39, 1)),
                const CustomText(
                    text: "Founder",
                    fontFamily: CustomFonts.roboto,
                    size: 0.03,
                    color: Color.fromRGBO(0, 0, 0, 0.63)),
              ],
            ),
          ),
        );
      },
      itemCount: count,
    );
  }
}