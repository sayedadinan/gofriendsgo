import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/app_textfields.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/signup_screen/signup_screen.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:gofriendsgo/widgets/login_widget/login_text.dart';
import 'package:provider/provider.dart';

TextEditingController emailController = TextEditingController();
final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
            Form(
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBoxHeight(0.1),
                  const AppdecorText(
                    text: 'Login',
                    size: 0.08,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                  const CustomSizedBoxHeight(0.05),
                  const CustomText(
                      fontFamily: CustomFonts.poppins,
                      text: TextStrings.loginMainText,
                      size: 0.04,
                      color: Colors.black),
                  const CustomSizedBoxHeight(0.04),
                  const CustomText(
                      fontFamily: CustomFonts.poppins,
                      text: 'Email Address',
                      size: 0.04,
                      color: Colors.black),
                  Inputfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }

                        final emailRegExp = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      controller: emailController,
                      hinttext: 'abc@gmail.com',
                      prefixIcon: const Icon(Icons.email_outlined))
                ],
              ),
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
                      if (loginFormKey.currentState!.validate()) {
                          context
                              .read<UserViewModel>()
                              .loginUser(emailController.text);
                    
                      } else {
                        return;
                      }
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
class RegisterLoadingIndicator extends StatelessWidget {
  const RegisterLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: .2,
      child: Column(
        children: [
          SizedBox(
            height: mediaqueryheight(0.36, context),
          ),
        Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
Future<dynamic> loadingIndicator(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const PopScope(
          canPop: false,
          child: Center(child: RegisterLoadingIndicator()));
    },
  );
}