import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/cab_rates_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class CabRatesTitle extends StatelessWidget {
  const CabRatesTitle({
    super.key,
    required this.serviceDetails,
  });

  final CabRatesModel serviceDetails;

  @override
  Widget build(BuildContext context) {
    return CustomText(
        text: serviceDetails.location,
        fontFamily: CustomFonts.roboto,
        size: 0.06,
        color: AppColors.blackColor);
  }
}
