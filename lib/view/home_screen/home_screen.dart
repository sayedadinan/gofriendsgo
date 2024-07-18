import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/home_grid_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/custom_list.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/grid_for_home.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/home_appbar.dart';
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
            Padding(
              padding: EdgeInsets.only(left: mediaquerywidth(0.04, context)),
              child: SizedBox(
                height: mediaqueryheight(0.32, context),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final item = homeGridItems[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: mediaquerywidth(0.40, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor),
                        child: Column(
                          children: [
                            const CustomSizedBoxHeight(0.02),
                            Image.asset(AppImages.tripImage),
                            CustomText(
                              text: item.titleText,
                              fontFamily: CustomFonts.inter,
                              size: 0.03,
                              color: AppColors.blackColor,
                              weight: FontWeight.w700,
                            ),
                            const CustomSizedBoxHeight(0.01),
                            CustomText(
                                textAlign: TextAlign.center,
                                text: item.subText,
                                fontFamily: CustomFonts.inter,
                                size: 0.02,
                                color: AppColors.blackColor),
                            const CustomSizedBoxHeight(0.01),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      end: Alignment.centerLeft,
                                      begin: Alignment.centerRight,
                                      colors: AppColors.gradientColors),
                                  borderRadius: BorderRadius.circular(12)),
                              width: mediaquerywidth(0.23, context),
                              height: mediaqueryheight(0.04, context),
                              child: const Center(
                                child: CustomText(
                                    text: 'Get Details',
                                    fontFamily: CustomFonts.inter,
                                    size: 0.03,
                                    color: Colors.white),
                              ),
                            ),
                            const CustomSizedBoxHeight(0.01),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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
