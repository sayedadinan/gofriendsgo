import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/view_model/bookings_viewmodel.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_container.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_searchbar.dart';
import 'package:provider/provider.dart';

class BookingDetailsScreen extends StatefulWidget {
  final bool fromBottomNav;
  const BookingDetailsScreen({super.key, required this.fromBottomNav});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  void initState() {
    context.read<BookingViewModel>().fetchBookingsfromservice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: CommonGradientAppBar(
            heading: "Bookings",
            fromBottomNav: widget.fromBottomNav,
          )),
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<BookingViewModel>(builder: (context, value, child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomSizedBoxHeight(0.03),
              BookingDetailsSearch(),
              CustomSizedBoxHeight(0.02),
              BookingDetailsContainer(),
            ],
          ),
        );
      }),
    );
  }
}
