import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/app_textfields.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/otp_verify_screen/otp_screen.dart';
import 'package:gofriendsgo/view/signup_screen/signup_screen.dart';
import 'package:gofriendsgo/widgets/login_widget/login_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: commonScreenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSizedBoxHeight(0.1),
                AppdecorText(
                  text: 'Login',
                  size: 0.08,
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),
                CustomSizedBoxHeight(0.05),
                CustomText(
                    fontFamily: CustomFonts.poppins,
                    text: TextStrings.loginMainText,
                    size: 0.04,
                    color: Colors.black),
                CustomSizedBoxHeight(0.04),
                CustomText(
                    fontFamily: CustomFonts.poppins,
                    text: 'Email Address',
                    size: 0.04,
                    color: Colors.black),
                Inputfield(
                    hinttext: 'abc@gmail.com',
                    prefixIcon: Icon(Icons.email_outlined))
              ],
            ),
            Column(
              children: [
                LoginText(onTapSignUp: () {
                  PageNavigations().push(const SignUpScreen());
                }),
                const CustomSizedBoxHeight(0.02),
                CustomButton(
                    fontFamily: CustomFonts.poppins,
                    function: () {
                      PageNavigations().push(const OtpVerifyScreen());
                    },
                    text: 'Get OTP',
                    fontSize: 0.04,
                    buttonTextColor: Colors.white,
                    borderColor: Colors.transparent),
                const CustomSizedBoxHeight(0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
