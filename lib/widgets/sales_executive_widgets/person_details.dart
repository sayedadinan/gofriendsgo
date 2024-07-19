import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class SalesExecutiveName extends StatelessWidget {
  const SalesExecutiveName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomText(
        text: "Devon Lane",
        fontFamily: CustomFonts.roboto,
        size: 0.05,
        weight: FontWeight.w500,
        color: AppColors.blackColor);
  }
}

class ContactPhoneAndEmailLogo extends StatelessWidget {
  const ContactPhoneAndEmailLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.backgroundColor),
              borderRadius: BorderRadius.circular(90)),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              Icons.email_outlined,
              size: mediaquerywidth(0.06, context),
            ),
          ),
        ),
        const CustomSizedBoxWidth(0.02),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.backgroundColor),
              borderRadius: BorderRadius.circular(90)),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Icon(
              Icons.call,
              size: mediaquerywidth(0.06, context),
            ),
          ),
        )
      ],
    );
  }
}

class SalesExecutiveImage extends StatelessWidget {
  const SalesExecutiveImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaquerywidth(0.2, context),
      height: mediaqueryheight(0.12, context),
      decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVeVNrw_5JYx80ESLOHIVIyBbaeZxtXaJK9A&s"))),
    );
  }
}
