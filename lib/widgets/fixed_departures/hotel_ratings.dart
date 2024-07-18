
import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/fixed_departures.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
class HotelRatings extends StatelessWidget {
  const HotelRatings({
    super.key,
    required this.package,
  });

  final FixedDepartures package;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.hotel),
        const CustomSizedBoxWidth(0.03),
        ...List.generate(
          5,
          (index) {
            return Icon(
              Icons.star_rate_rounded,
              color: index > package.rating - 1
                  ? AppColors.backgroundColor
                  : AppColors.fixedDeparturesAmberColor,
            );
          },
        )
      ],
    );
  }
}