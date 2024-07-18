import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/fixed_departures.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
class FlightDeparture extends StatelessWidget {
  const FlightDeparture({
    super.key,
    required this.package,
  });

  final FixedDepartures package;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomSizedBoxWidth(0.005),
        Image.asset(AppImages.flightTakeOff),
        const CustomSizedBoxWidth(0.045),
        CustomText(
            text: package.locations,
            fontFamily: CustomFonts.roboto,
            size: 0.040,
            color: const Color.fromRGBO(0, 0, 0, 0.9))
      ],
    );
  }
}