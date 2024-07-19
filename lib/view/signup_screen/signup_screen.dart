import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/home_screen/home_screen.dart';
import 'package:gofriendsgo/view/login_screen/login_screen.dart';
import 'package:gofriendsgo/widgets/signup_widget/custom_field.dart';
import 'package:gofriendsgo/widgets/signup_widget/drop_down.dart';
import 'package:gofriendsgo/widgets/signup_widget/sign_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: commonScreenPadding(context),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSizedBoxHeight(0.1),
                  AppdecorText(
                    text: 'Sign Up',
                    size: 0.08,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  CustomSizedBoxHeight(0.05),
                  LabeledInputField(
                    hintText: 'Enter your Name',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  CustomSizedBoxHeight(0.02),
                  LabeledInputField(
                    hintText: 'Enter your Email Address',
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  CustomSizedBoxHeight(0.02),
                  LabeledInputField(
                    hintText: '12FDFVD',
                    labelText: 'Referral Code',
                    prefixIcon: Icon(Icons.tag),
                  ),
                  CustomSizedBoxHeight(0.02),
                  StaticDropdownField()
                ],
              ),
              const CustomSizedBoxHeight(0.09),
              Column(
                children: [
                  const CustomSizedBoxHeight(0.12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignUpText(
                        onTapLogin: () {
                          PageNavigations().push(const LoginScreen());
                        },
                      ),
                    ],
                  ),
                  const CustomSizedBoxHeight(0.03),
                  CustomButton(
                      function: () {
                        PageNavigations().push(HomeScreen());
                      },
                      text: 'Get OTP',
                      fontSize: 0.04,
                      buttonTextColor: AppColors.whiteColor,
                      borderColor: AppColors.transparentColor,
                      fontFamily: CustomFonts.poppins),
                  const CustomSizedBoxHeight(0.03),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
