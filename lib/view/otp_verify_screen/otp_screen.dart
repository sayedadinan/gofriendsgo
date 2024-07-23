import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/login_screen/login_screen.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:gofriendsgo/widgets/otp_widgets/edit_text.dart';
import 'package:gofriendsgo/widgets/otp_widgets/otp_field.dart';
import 'package:provider/provider.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  late TextEditingController controller5;

  late List<FocusNode> focusNodes;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();

    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusNode focusNode3 = FocusNode();
    FocusNode focusNode4 = FocusNode();
    FocusNode focusNode5 = FocusNode();

    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();

    focusNodes = [focusNode1, focusNode2, focusNode3, focusNode4, focusNode5];
    controllers = [
      controller1,
      controller2,
      controller3,
      controller4,
      controller5
    ];
  }

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String getOtpCode() {
    return controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: commonScreenPadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBoxHeight(topPadding),
                GestureDetector(
                  onTap: () {
                    PageNavigations().pop();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 226, 223, 223),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(mediaquerywidth(0.03, context)),
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ),
                const CustomSizedBoxHeight(0.04),
                const CustomText(
                  fontFamily: CustomFonts.poppins,
                  text: 'Enter code',
                  size: 0.08,
                  color: Colors.black,
                  weight: FontWeight.w800,
                ),
                const CustomSizedBoxHeight(0.02),
                const CustomText(
                  fontFamily: CustomFonts.poppins,
                  text: TextStrings.otpScreenMain,
                  size: 0.04,
                  color: Colors.black,
                ),
                const CustomSizedBoxHeight(0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => buildOTPField(
                      context,
                      focusNodes,
                      controllers,
                      index,
                    ),
                  ),
                ),
                const CustomEditText(),
              ],
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      fontFamily: CustomFonts.poppins,
                      text: 'Send code again   00:20  ',
                      size: 0.04,
                      color: Colors.black,
                    ),
                  ],
                ),
                CustomButton(
                  function: () {
                    String otpCode = getOtpCode();
                    int val = int.parse(otpCode);
                    log(otpCode);
                    Provider.of<UserViewModel>(context, listen: false)
                        .verifyOtp(
                      val,
                      emailController.text,
                    );
                    // Do something with otpCode
                    // PageNavigations().push(const SuccessScreen());
                  },
                  text: 'Get OTP',
                  fontSize: 0.04,
                  buttonTextColor: Colors.white,
                  borderColor: Colors.transparent,
                  fontFamily: CustomFonts.poppins,
                ),
                const CustomSizedBoxHeight(0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
