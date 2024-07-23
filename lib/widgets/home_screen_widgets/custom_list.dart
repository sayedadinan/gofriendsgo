import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/story_model/story_model.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: mediaquerywidth(0.14, context),
          height: mediaquerywidth(0.14,
              context), // Ensure the height is the same as width for a perfect circle
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromRGBO(236, 147, 255, 1),
              width: 3.0,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              "https://gofriendsgo.teqsuit.com/public/storage/${story.image}",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AppImages.goFriendsGoLogo);
              },
            ),
          ),
        ),
        SizedBox(height: 4.0),
        CustomText(
          text: story.title,
          fontFamily: CustomFonts.poppins,
          size: 0.04,
          color: Colors.black,
        ),
      ],
    );
  }
}
