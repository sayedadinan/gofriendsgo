import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/fixed_departures.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class FixedDeparturesPackageHeading extends StatelessWidget {
  const FixedDeparturesPackageHeading({
    super.key,
    required this.package,
  });

  final FixedDepartures package;

  @override
  Widget build(BuildContext context) {
    return CustomText(
        weight: FontWeight.w800,
        text: package.title,
        fontFamily: CustomFonts.roboto,
        size: 0.07,
        color: const Color.fromRGBO(85, 24, 177, 1));
  }
}