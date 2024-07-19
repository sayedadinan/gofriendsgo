import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_appbar.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_container.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_searchbar.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.09, context)),
          child: const BookingDetailsAppbar()),
      backgroundColor: AppColors.backgroundColor,
      body: const Column(
        children: [
          CustomSizedBoxHeight(0.03),
          BookingDetailsSearch(),
          CustomSizedBoxHeight(0.02),
          BookingDetailsContainer(),
        ],
      ),
    );
  }
}
