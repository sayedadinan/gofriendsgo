import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/about_us_screen/about_us_screen.dart';
import 'package:gofriendsgo/view/booking_screen/booking_screen.dart';
import 'package:gofriendsgo/view/login_screen/login_screen.dart';
import 'package:gofriendsgo/view/meet_the_team_screen/meet_the_team_screen.dart';
import 'package:gofriendsgo/view/sales_executive_screen/sales_executive_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerListItems extends StatelessWidget {
  const DrawerListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBoxHeight(0.02),
        Padding(
          padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
          child: const CustomText(
              text: TextStrings.myAccount,
              fontFamily: CustomFonts.roboto,
              size: 0.04,
              color: AppColors.onBoardingSubtitleColor),
        ),
        ListTile(
          leading: const Icon(Icons.home_filled),
          title: const Text(TextStrings.home),
          onTap: () {
            PageNavigations().pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.badge_outlined),
          title: const Text(TextStrings.myBookings),
          onTap: () {
            PageNavigations().push(const BookingDetailsScreen(
              fromBottomNav: false,
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.hail),
          title: const Text(TextStrings.salesExecutive),
          onTap: () {
            PageNavigations().push(const SalesExecutiveScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.groups_2_outlined),
          title: const Text(TextStrings.ourTeam),
          onTap: () {
            PageNavigations().push(const MeetTheTeamScreen());
          },
        ),
        const ListTile(
            leading: Icon(Icons.collections), title: Text(TextStrings.gallery)),
        ListTile(
          leading: const Icon(Icons.star_half_rounded),
          title: const Text(TextStrings.rateUs),
          onTap: () {
            PageNavigations().push(const AboutUsScreen());
          },
        ),
        ListTile(
          leading: const Icon(Icons.business),
          title: const Text(TextStrings.aboutUs),
          onTap: () {
            PageNavigations().push(const AboutUsScreen());
          },
        ),
        ListTile(
            onTap: () async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setString(TextStrings.authToken, "");
              PageNavigations().pushAndRemoveUntill( LoginScreen());
            },
            leading: const Icon(Icons.logout_outlined),
            title: const Text(TextStrings.logout)),
      ],
    );
  }
}
