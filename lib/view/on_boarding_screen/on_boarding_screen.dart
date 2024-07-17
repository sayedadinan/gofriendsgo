import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/on_boarding_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = onBoardingList;
    final pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: controller.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Padding(
              padding: commonScreenPadding(context),
              child: Column(
                children: [
                  CustomSizedBoxHeight(0.03),
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomPaint(
                      painter: GradientBorderPainter(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: mediaqueryheight(0.01, context),
                            horizontal: mediaquerywidth(0.06, context),
                          ),
                          child: CustomText(
                            weight: FontWeight.w500,
                            fontFamily: CustomFonts.poppins,
                            text: "Skip",
                            size: 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomSizedBoxHeight(0.1),
                  Image.asset(
                    controller[index].imagePath,
                    filterQuality: FilterQuality.high,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.length,
                  ),
                  CustomSizedBoxHeight(0.04),
                  CustomText(
                      text: controller[index].title,
                      fontFamily: CustomFonts.inknut,
                      size: 0.07,
                      color: AppColors.blackColor),
                  CustomSizedBoxHeight(0.04),
                  Container(
                    width: mediaquerywidth(0.7, context),
                    child: CustomText(
                        text: controller[index].subTitle,
                        fontFamily: CustomFonts.inter,
                        size: 0.032,
                        textAlign: TextAlign.center,
                        color: AppColors.onBoardingSubtitleColor),
                  ),
                  CustomSizedBoxHeight(0.05),
                  OnBoardingButton(
                      function: () {},
                      text: pageController.page! < 2 ? "Next" : "Get Started",
                      fontSize: 0.04,
                      buttonTextColor: AppColors.whiteColor,
                      borderColor: AppColors.transparentColor,
                      fontFamily: CustomFonts.poppins)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: AppColors.gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(
        center: size.center(Offset.zero),
        radius: size.width / 2,
      ))
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(90),
      ));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
