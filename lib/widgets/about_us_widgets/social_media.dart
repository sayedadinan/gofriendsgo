import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.instagram),
        const CustomSizedBoxWidth(0.06),
        Image.asset(AppImages.twitter),
        const CustomSizedBoxWidth(0.06),
        Image.asset(AppImages.facebook),
        const CustomSizedBoxWidth(0.06),
        Image.asset(AppImages.linkedin),
        const CustomSizedBoxWidth(0.06),
        Image.asset(AppImages.whatsapp)
      ],
    );
  }
}