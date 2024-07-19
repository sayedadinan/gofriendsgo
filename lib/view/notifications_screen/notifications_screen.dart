import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/notification_card_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/gradient_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/notification_widgets/appbar_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const NotificationBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSizedBoxHeight(0.02),
            Row(
              children: [
                const CustomSizedBoxWidth(0.08),
                Container(
                  width: mediaquerywidth(0.17, context),
                  height: mediaqueryheight(0.04, context),
                  decoration: BoxDecoration(
                      color: AppColors.allNotificationColor,
                      borderRadius: BorderRadius.circular(08)),
                  child: Center(
                    child: GradientText(
                      'All',
                      gradient: const LinearGradient(
                          colors: AppColors.gradientColors),
                      style:
                          TextStyle(fontSize: mediaquerywidth(0.04, context)),
                    ),
                  ),
                ),
                const CustomSizedBoxWidth(0.03),
                Container(
                  width: mediaquerywidth(0.27, context),
                  height: mediaqueryheight(0.04, context),
                  decoration: BoxDecoration(
                      color: AppColors.unreadColor,
                      borderRadius: BorderRadius.circular(08)),
                  child: const Center(
                      child: CustomText(
                          text: 'Unread',
                          fontFamily: CustomFonts.roboto,
                          size: 0.04,
                          color: AppColors.blackColor)),
                ),
              ],
            ),
            const CustomSizedBoxHeight(0.03),
            SizedBox(
              height: mediaqueryheight(0.89, context),
              child: ListView.builder(
                itemCount: notificationCard.length,
                itemBuilder: (context, index) {
                  final notificationCardList = notificationCard[index];
                  return Container(
                    color: AppColors.backgroundColor,
                    width: double.infinity,
                    height: mediaqueryheight(0.23, context),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(253, 230, 255, 1),
                            borderRadius: BorderRadius.circular(12)),
                        width: mediaquerywidth(0.15, context),
                        height: mediaqueryheight(0.07, context),
                        child: Image.asset('assets/images/Hotel icon.png'),
                      ),
                      title: CustomText(
                          weight: FontWeight.w600,
                          text: notificationCardList.mainText,
                          fontFamily: CustomFonts.roboto,
                          size: 0.04,
                          color: AppColors.blackColor),
                      subtitle: CustomText(
                          weight: FontWeight.w300,
                          text: notificationCardList.subText,
                          fontFamily: CustomFonts.roboto,
                          size: 0.04,
                          color: AppColors.blackColor),
                    ),
                    // child: Row(
                    //   children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromRGBO(253, 230, 255, 1),
                    //       borderRadius: BorderRadius.circular(12)),
                    //   width: mediaquerywidth(0.15, context),
                    //   height: mediaqueryheight(0.07, context),
                    //   child: Image.asset('assets/images/Hotel icon.png'),
                    // ),
                    //     const CustomSizedBoxWidth(0.03),
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         CustomText(
                    //             weight: FontWeight.w600,
                    //             text: notificationCardList.mainText,
                    //             fontFamily: CustomFonts.roboto,
                    //             size: 0.04,
                    //             color: AppColors.blackColor),
                    // CustomText(
                    //     weight: FontWeight.w300,
                    //     text: notificationCardList.subText,
                    //     fontFamily: CustomFonts.roboto,
                    //     size: 0.04,
                    //     color: AppColors.blackColor),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
