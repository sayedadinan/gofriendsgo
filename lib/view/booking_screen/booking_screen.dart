import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_container.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_searchbar.dart';

class BookingDetailsScreen extends StatelessWidget {
  final bool fromBottomNav;
  const BookingDetailsScreen({super.key, required this.fromBottomNav});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child:  CommonGradientAppBar(heading: "Bookings",fromBottomNav:fromBottomNav,)),
      backgroundColor: AppColors.backgroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomSizedBoxHeight(0.03),
            BookingDetailsSearch(),
            CustomSizedBoxHeight(0.02),
            BookingDetailsContainer(),
          ],
        ),
      ),
    );
  }
}
