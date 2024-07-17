import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBoxHeight(0.1),
                  const AppdecorText(
                    text: 'Sign Up',
                    size: 0.08,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  const CustomSizedBoxHeight(0.05),
                  const LabeledInputField(
                    hintText: 'Enter your Name',
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  const CustomSizedBoxHeight(0.02),
                  const LabeledInputField(
                    hintText: 'Enter your Email Address',
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  const CustomSizedBoxHeight(0.02),
                  const LabeledInputField(
                    hintText: '12FDFVD',
                    labelText: 'Referral Code',
                    prefixIcon: Icon(Icons.tag),
                  ),
                  const CustomSizedBoxHeight(0.02),
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
                      function: () {},
                      text: 'Get OTP',
                      fontSize: 0.04,
                      buttonTextColor: AppColors.whiteColor,
                      borderColor: AppColors.transparentColor,
                      fontFamily: CustomFonts.poppins),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
