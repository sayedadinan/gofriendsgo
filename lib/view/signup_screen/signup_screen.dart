import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/user_model/user_details_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/login_screen/login_screen.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:gofriendsgo/widgets/signup_widget/custom_field.dart';
import 'package:gofriendsgo/widgets/signup_widget/drop_down.dart';
import 'package:gofriendsgo/widgets/signup_widget/sign_text.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _refferelController = TextEditingController();
  TextEditingController _sourceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
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
                  LabeledInputField(
                    controller: _nameController,
                    hintText: 'Enter your Name',
                    labelText: 'Name',
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  const CustomSizedBoxHeight(0.02),
                  LabeledInputField(
                    controller: _emailController,
                    hintText: 'Enter your Email Address',
                    labelText: 'Email Address',
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  const CustomSizedBoxHeight(0.02),
                  LabeledInputField(
                    controller: _refferelController,
                    hintText: '12FDFVD',
                    labelText: 'Referral Code',
                    prefixIcon: const Icon(Icons.tag),
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
                      function: () async {
                        _sourceController.text = userViewModel.sourceController;
                        log(_sourceController.text);
                        UserDetails userDetails = UserDetails(
                          name: _nameController.text,
                          email: _emailController.text,
                          role: 'user',
                          source: _sourceController.text,
                        );
                        await userViewModel.registerUser(userDetails);
                        // PageNavigations().push(HomeScreen());
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
