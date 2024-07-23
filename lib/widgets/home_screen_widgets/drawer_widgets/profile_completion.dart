import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class ProfileCompletionStatus extends StatelessWidget {
  const ProfileCompletionStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
            text: TextStrings.profileProgress,
            fontFamily: CustomFonts.poppins,
            size: 0.027,
            color: Color.fromRGBO(20, 20, 20, .6)),
        CustomText(
            text: TextStrings.addPhoto,
            fontFamily: CustomFonts.poppins,
            size: 0.027,
            color: Color.fromRGBO(21, 1, 154, 1))
      ],
    );
  }
}
