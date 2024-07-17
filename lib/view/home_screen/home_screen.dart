import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/custom_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  PageController adController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 220, 239),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.07, context)),
          child: Container(
            height: mediaqueryheight(0.18, context),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: AppColors.gradientColors,
            )),
            child: const Column(
              children: [
                CustomSizedBoxHeight(0.04),
                Row(
                  children: [
                    CustomSizedBoxWidth(0.03),
                    Icon(Icons.menu, color: AppColors.whiteColor),
                    CustomSizedBoxWidth(0.05),
                    CustomText(
                        text: 'Home',
                        fontFamily: CustomFonts.poppins,
                        size: 0.05,
                        color: AppColors.whiteColor),
                    CustomSizedBoxWidth(0.6),
                    Icon(Icons.notification_add, color: AppColors.whiteColor),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
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
                            image: AssetImage(
                              AppImages.adImage,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12)),
                  );
                },
              ),
            ),
            const CustomSizedBoxHeight(0.01),
            Transform.scale(
              scale: 0.5,
              child: SmoothPageIndicator(
                controller: adController,
                count: 4,
              ),
            ),
            Container(
              color: const Color.fromRGBO(236, 228, 255, 1),
              // width: mediaquerywidth(0.34, context),
              height: mediaqueryheight(0.2, context),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          const CustomSizedBoxHeight(0.02),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: mediaquerywidth(0.14, context),
                            height: mediaqueryheight(0.06, context),
                            child: Center(
                              child: Image.asset(AppImages.onboardingFirst),
                            ),
                          ),
                          const CustomText(
                              text: 'Hotel Booking',
                              fontFamily: CustomFonts.inter,
                              size: 0.02,
                              color: Colors.black)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
