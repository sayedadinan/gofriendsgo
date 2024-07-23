import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/home_grid_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/cab_rates_screen/cab_rates_screen.dart';
import 'package:gofriendsgo/view/fixed_departures_screen/fixed_departures_screen.dart';
import 'package:gofriendsgo/view/passport_checlist/passport_checklist_screen.dart';
import 'package:gofriendsgo/view/visa_checklist/visa_checlist_screen.dart';
import 'package:gofriendsgo/view_model/banner_viewmodel.dart';
import 'package:gofriendsgo/view_model/carosual_viewmodel.dart';
import 'package:gofriendsgo/view_model/stories_viewmodel.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/custom_list.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widget.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/grid_for_home.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/home_appbar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  PageController adController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      backgroundColor: const Color.fromARGB(255, 197, 220, 239),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const HomeAppbar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: commonScreenPadding(context)),
            SizedBox(
              height: mediaqueryheight(0.12, context),
              child: Consumer<StoriesViewModel>(
                builder: (context, storiesViewModel, child) {
                  if (storiesViewModel.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          storiesViewModel.storiesResponse!.data.stories.length,
                      itemBuilder: (context, index) {
                        final story = storiesViewModel
                            .storiesResponse!.data.stories[index];
                        return Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: StoryItem(story: story),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              width: mediaquerywidth(0.95, context),
              height: mediaqueryheight(0.23, context),
              child: Consumer<CarosualViewModel>(
                builder: (context, carosualViewModel, child) {
                  if (carosualViewModel.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return PageView.builder(
                      controller: adController,
                      itemCount: carosualViewModel.carouselsModel!.data.length,
                      itemBuilder: (context, index) {
                        final carosuals =
                            carosualViewModel.carouselsModel!.data[index];
                        return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://gofriendsgo.teqsuit.com/public/storage/${carosuals.image}"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)));
                      },
                    );
                  }
                },
              ),
            ),
            const CustomSizedBoxHeight(0.01),
            Transform.scale(
                scale: 0.5,
                child: SmoothPageIndicator(controller: adController, count: 3)),
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
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          PageNavigations().push(const FixedDeparturesScreen());
                        } else if (index == 1) {
                          PageNavigations()
                              .push(const PassportChecklistScreen());
                        } else {
                          PageNavigations().push(const VisaChecklistScreen());
                        }
                      },
                      child: Padding(
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
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () => PageNavigations().push(const CabRatesScreen()),
                child: Consumer<BannerViewModel>(
                    builder: (context, bannerViewModel, child) {
                  if (bannerViewModel.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  final banner =
                      bannerViewModel.bannersResponse!.data.banners[0];
                  return ClipRRect(
                    child: SizedBox(
                      height: mediaqueryheight(0.08, context),
                      child: Image.network(
                          "https://gofriendsgo.teqsuit.com/public/storage/${banner.image}",
                          errorBuilder: (context, error, stackTrace) {
                        return Image.asset(AppImages.goFriendsGoLogo);
                      }, fit: BoxFit.cover),
                    ),
                  );
                }),
              ),
            ),
            const CustomSizedBoxHeight(0.03),
          ],
        ),
      ),
    );
  }
}
