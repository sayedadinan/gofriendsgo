import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class GetDetailsAndAmount extends StatelessWidget {
  const GetDetailsAndAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomSizedBoxWidth(0.04),
        CustomButton(
          // fontWeight: FontWeight.w500,
          function: () {},
          text: TextStrings.getDetailsButtonText,
          fontSize: 0.04,
          buttonTextColor: AppColors.whiteColor,
          borderColor: AppColors.transparentColor,
          fontFamily: CustomFonts.roboto,
        ),
        const CustomSizedBoxWidth(0.04),
        const Column(
          children: [
            CustomText(
                text: "₹ 12,000",
                fontFamily: CustomFonts.roboto,
                size: 0.07,
                weight: FontWeight.w800,
                color: AppColors.fixedDeparturesAmberColor),
            CustomText(
              text: TextStrings.perPerson,
              fontFamily: CustomFonts.roboto,
              size: 0.035,
              color: Color.fromRGBO(0, 0, 0, 0.7),
              weight: FontWeight.w500,
            )
          ],
        ),
        const SizedBox()
      ],
    );
  }
}
