import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/booking_card_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/gradient_icons.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class BookingDetailsContainer extends StatelessWidget {
  const BookingDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: mediaqueryheight(0.7, context),
      width: mediaquerywidth(0.94, context),
      child: ListView.builder(
        itemCount: bookingCardList.length,
        itemBuilder: (context, index) {
          final bookingList = bookingCardList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
              ),
              width: mediaquerywidth(0.33, context),
              height: mediaqueryheight(0.15, context),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: mediaquerywidth(0.03, context),
                      right: mediaquerywidth(0.03, context),
                      top: mediaquerywidth(0.02, context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            weight: FontWeight.w800,
                            text: bookingList.mainText,
                            fontFamily: CustomFonts.roboto,
                            size: 0.04,
                            color: AppColors.blackColor),
                        CustomText(
                            weight: FontWeight.w800,
                            text: bookingList.bookingAmount,
                            fontFamily: CustomFonts.roboto,
                            size: 0.04,
                            color: AppColors.blackColor),
                      ],
                    ),
                  ),
                  const CustomSizedBoxHeight(0.01),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mediaquerywidth(0.03, context),
                      right: mediaquerywidth(0.03, context),
                      top: mediaquerywidth(0.02, context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: bookingList.bookingName,
                            fontFamily: CustomFonts.roboto,
                            size: 0.037,
                            color: AppColors.blackColor),
                        CustomText(
                            text: bookingList.bookingDate,
                            fontFamily: CustomFonts.roboto,
                            size: 0.037,
                            color: AppColors.blackColor),
                      ],
                    ),
                  ),
                  const Divider(endIndent: 20, indent: 20),
                  Padding(
                    padding: EdgeInsets.only(
                      left: mediaquerywidth(0.03, context),
                      right: mediaquerywidth(0.03, context),
                      bottom: mediaquerywidth(0.01, context),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            weight: FontWeight.w600,
                            text: bookingList.bookingType,
                            fontFamily: CustomFonts.roboto,
                            size: 0.04,
                            color: AppColors.blackColor),
                        GradientIcon(
                            Icons.download_for_offline_outlined,
                            mediaquerywidth(0.07, context),
                            const LinearGradient(
                                colors: AppColors.gradientColors)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
