import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/custom_list.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/grid_for_home.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/home_appbar.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/home_package_grids.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  PageController adController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 220, 239),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.07, context)),
          child: const HomeAppbar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: commonScreenPadding(context)),
            SizedBox(
              height: mediaqueryheight(0.12, context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 25,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: StoryItem(),
                  );
                },
              ),
            ),
            SizedBox(
              height: mediaqueryheight(0.23, context),
              child: PageView.builder(
                controller: adController,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppImages.adImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12)));
                },
              ),
            ),
            const CustomSizedBoxHeight(0.01),
            Transform.scale(
                scale: 0.5,
                child: SmoothPageIndicator(controller: adController, count: 4)),
            const GridForHomeScreen(),
            const HomePackageOptions(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: mediaqueryheight(0.08, context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.homeOffer),
                        fit: BoxFit.cover)),
              ),
            ),
            const CustomSizedBoxHeight(0.03),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomNavigationItem(icon: Icons.home_filled, label: 'Home'),
            buildBottomNavigationItem(
                icon: Icons.bookmark_add, label: 'Bookings'),
            buildBottomNavigationItem(icon: Icons.forum, label: 'Chats'),
            buildBottomNavigationItem(
                icon: Icons.account_circle_outlined, label: 'Profile'),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}

Widget buildBottomNavigationItem(
    {required IconData icon, required String label}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon, color: Colors.black),
      Text(label, style: const TextStyle(color: Colors.black)),
    ],
  );
}
