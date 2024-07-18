import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/fixed_departures.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class ScheduledDays extends StatelessWidget {
  const ScheduledDays({
    super.key,
    required this.package,
  });

  final FixedDepartures package;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomSizedBoxWidth(0.005),
        Image.asset(AppImages.date),
        const CustomSizedBoxWidth(0.045),
        CustomText(
            text: package.date,
            fontFamily: CustomFonts.roboto,
            size: 0.04,
            color: const Color.fromRGBO(0, 0, 0, 0.9))
      ],
    );
  }
}