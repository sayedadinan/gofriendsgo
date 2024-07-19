import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/sales_executive_widgets/person_details.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SalesExecutiveImage(),
        CustomSizedBoxWidth(0.085),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SalesExecutiveName(),
                CustomSizedBoxWidth(0.02),
                Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.fixedDeparturesAmberColor,
                ),
                CustomSizedBoxWidth(0.02),
                CustomText(
                    text: "4.5",
                    fontFamily: CustomFonts.roboto,
                    size: 0.035,
                    weight: FontWeight.w500,
                    color: AppColors.blackColor)
              ],
            ),
            CustomText(
                text: TextStrings.salesExecutive,
                fontFamily: CustomFonts.roboto,
                size: 0.04,
                color: Color.fromRGBO(60, 60, 60, 1)),
            CustomSizedBoxHeight(0.01),
            ContactPhoneAndEmailLogo()
          ],
        )
      ],
    );
  }
}
