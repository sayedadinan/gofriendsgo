import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/success_screen/success_screen.dart';
import 'package:gofriendsgo/widgets/otp_widgets/edit_text.dart';
import 'package:gofriendsgo/widgets/otp_widgets/otp_field.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtpVerifyScreenState createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(5, (_) => FocusNode());
    _controllers = List.generate(5, (_) => TextEditingController());
  }

  @override
  void dispose() {
    // ignore: avoid_function_literals_in_foreach_calls
    _focusNodes.forEach((node) => node.dispose());
    // ignore: avoid_function_literals_in_foreach_calls
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
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
                          context, _focusNodes, _controllers, index)),
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
                    PageNavigations().push(const SuccessScreen());
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
