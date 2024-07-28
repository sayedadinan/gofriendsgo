import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: value.userName!,
                    fontFamily: CustomFonts.poppins,
                    size: 0.040,
                    weight: FontWeight.w600,
                    color: AppColors.blackColor),
                CustomText(
                    text: value.userPhone!,
                    fontFamily: CustomFonts.poppins,
                    size: 0.035,
                    color: Color.fromRGBO(20, 20, 20, .6)),
                CustomText(
                    text: value.userEmail!,
                    fontFamily: CustomFonts.poppins,
                    size: 0.035,
                    color: Color.fromRGBO(20, 20, 20, .6)),
              ]);
        }
      },
    );
  }
}
