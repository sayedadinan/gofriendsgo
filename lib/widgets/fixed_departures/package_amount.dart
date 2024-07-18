import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/fixed_departures.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
class TotalPackageAmount extends StatelessWidget {
  const TotalPackageAmount({
    super.key,
    required this.package,
  });

  final FixedDepartures package;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
            text: "₹ ${package.amount}",
            fontFamily: CustomFonts.roboto,
            size: 0.07,
            weight: FontWeight.w800,
            color:
                AppColors.fixedDeparturesAmberColor),
        const CustomText(
          text: TextStrings.perPerson,
          fontFamily: CustomFonts.roboto,
          size: 0.035,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          weight: FontWeight.w500,
        )
      ],
    );
  }
}