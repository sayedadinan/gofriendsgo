import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: mediaquerywidth(0.15, context), // Adjust the width as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromRGBO(
                  236, 147, 255, 1), // Color of the outline
              width: 3.0, // Width of the outline
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              AppImages.onboardingFirst, // Replace with your image path
            ),
          ),
        ),
        const CustomText(
            text: 'John',
            fontFamily: CustomFonts.poppins,
            size: 0.04,
            color: Colors.black)
      ],
    );
  }
}
