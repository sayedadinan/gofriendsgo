import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/about_us_screen/about_us_screen.dart';
import 'package:gofriendsgo/view/booking_screen/booking_screen.dart';
import 'package:gofriendsgo/view/meet_the_team_screen/meet_the_team_screen.dart';
import 'package:gofriendsgo/view/sales_executive_screen/sales_executive_screen.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Row(
              children: [
                CircleAvatar(),
                CustomSizedBoxWidth(0.04),
                CustomText(
                  text: 'puneeth rajkumar',
                  color: AppColors.blackColor,
                  fontFamily: CustomFonts.roboto,
                  size: 0.04,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
            child: const CustomText(
                text: 'My Account',
                fontFamily: CustomFonts.roboto,
                size: 0.04,
                color: AppColors.onBoardingSubtitleColor),
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: const Text('My Booking'),
            onTap: () {
              PageNavigations().push(const BookingDetailsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.hail),
            title: const Text('Sales Executive'),
            onTap: () {
              PageNavigations().push(const SalesExecutiveScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.groups_2_outlined),
            title: const Text('Our Team'),
            onTap: () {
              PageNavigations().push(const MeetTheTeamScreen());
            },
          ),
          const ListTile(
              leading: Icon(Icons.collections), title: Text('Gallery')),
          ListTile(
            leading: const Icon(Icons.star_half_rounded),
            title: const Text('Rate Us'),
            onTap: () {
              PageNavigations().push(const AboutUsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('About Us'),
            onTap: () {
              PageNavigations().push(const AboutUsScreen());
            },
          ),
          const ListTile(
              leading: Icon(Icons.logout_outlined), title: Text('Logout')),
        ],
      ),
    );
  }
}
