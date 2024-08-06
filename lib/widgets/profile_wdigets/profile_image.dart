
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/constants/text_controllers.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';
import 'package:gofriendsgo/widgets/profile_wdigets/profile_edit_button.dart';
import 'package:gofriendsgo/widgets/signup_widget/custom_field.dart';
import 'package:provider/provider.dart';

class ImageOfProfile extends StatelessWidget {
  final ProfileViewModel value;
  const ImageOfProfile({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value.onEditPressed ? value.addNewImage() : null;
      },
      child: Container(
        height: mediaqueryheight(0.13, context),
        width: mediaqueryheight(0.13, context),
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: value.newImagePath == null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.asset(
                  AppImages.aboutUsImage,
                  fit: BoxFit.cover,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.file(
                  File(value.newImagePath!),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
