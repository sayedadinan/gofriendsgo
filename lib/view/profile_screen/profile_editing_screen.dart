import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/profile_wdigets/profile_edit_button.dart';
import 'package:gofriendsgo/widgets/signup_widget/custom_field.dart';

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: commonScreenPadding(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 38,
                backgroundColor: AppColors.blackColor,
                backgroundImage: AssetImage(AppImages.onboardingFirst),
              ),
              const CustomSizedBoxHeight(0.02),
              const CustomText(
                text: 'Nikhil Sharma',
                fontFamily: CustomFonts.roboto,
                size: 0.04,
                color: AppColors.blackColor,
                weight: FontWeight.w900,
              ),
              const profilepageeEditbutton(),
              const CustomSizedBoxHeight(0.01),
              const LabeledInputField(
                  hintText: 'puneeth Rajkumar', labelText: 'Name'),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Ankith Agira', labelText: 'Sales Executive Name'),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Ab2C Travels', labelText: 'Company Name'),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Abc@gmail.com',
                  labelText: 'Email',
                  suffix: Icon(Icons.done_rounded,
                      color: AppColors.succesIconColor)),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Select the date',
                  labelText: 'Date of Birth',
                  suffix: Icon(Icons.calendar_month,
                      color: AppColors.dateIconColor)),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Enter Mobile Number', labelText: 'Mobile'),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                hintText: 'Select the date',
                labelText: 'Marriage anniversary',
                suffix:
                    Icon(Icons.calendar_month, color: AppColors.dateIconColor),
              ),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Enter the Flyer No',
                  labelText: 'Frequent Flyer No'),
              const CustomSizedBoxHeight(0.02),
              const LabeledInputField(
                  hintText: 'Type your extra details here..',
                  labelText: 'Additional Details',
                  maxlngths: 3),
              const CustomSizedBoxHeight(0.12),
              CustomButton(
                  function: () {},
                  text: 'Save',
                  fontSize: 0.04,
                  buttonTextColor: AppColors.whiteColor,
                  borderColor: AppColors.transparentColor,
                  fontFamily: CustomFonts.poppins),
              const CustomSizedBoxHeight(0.04),
            ],
          ),
        ),
      ),
    );
  }
}
