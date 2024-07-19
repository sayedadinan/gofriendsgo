import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/chat_list_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_searchbar.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const CommonGradientAppBar(heading: 'Chats')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomSizedBoxHeight(0.03),
            const BookingDetailsSearch(),
            const CustomSizedBoxHeight(0.03),
            SizedBox(
              height: mediaqueryheight(0.85, context),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: chatModelList.length,
                itemBuilder: (context, index) {
                  final chatListModels = chatModelList[index];
                  return ListTile(
                    title: CustomText(
                      weight: FontWeight.w600,
                      text: chatListModels.mainText,
                      color: AppColors.blackColor,
                      fontFamily: CustomFonts.inter,
                      size: 0.04,
                    ),
                    subtitle: CustomText(
                      weight: FontWeight.w300,
                      text: chatListModels.subText,
                      color: AppColors.blackColor,
                      fontFamily: CustomFonts.inter,
                      size: 0.03,
                    ),
                    leading: Container(
                      width: mediaquerywidth(0.12, context),
                      height: mediaqueryheight(0.06, context),
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(AppImages.busIcon),
                      ),
                    ),
                    trailing: Column(
                      children: [
                        const CustomSizedBoxHeight(0.02),
                        CustomText(
                          weight: FontWeight.w300,
                          text: chatListModels.time,
                          color: AppColors.blackColor,
                          fontFamily: CustomFonts.inter,
                          size: 0.03,
                        ),
                      ],
                    ),
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
