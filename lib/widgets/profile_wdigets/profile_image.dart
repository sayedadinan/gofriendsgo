
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';

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
        decoration: const BoxDecoration(shape: BoxShape.circle),
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
