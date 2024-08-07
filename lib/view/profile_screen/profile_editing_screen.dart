// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/constants/text_controllers.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';
import 'package:gofriendsgo/widgets/profile_wdigets/profile_edit_button.dart';
import 'package:gofriendsgo/widgets/profile_wdigets/profile_image.dart';
import 'package:gofriendsgo/widgets/signup_widget/custom_field.dart';
import 'package:provider/provider.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  _ProfileEditingScreenState createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  @override
  void initState() {
    context.read<ProfileViewModel>().fetchProfile();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //   Fetch data from the provider
      final profileViewModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      profileViewModel.disposing();
      nameController.text = profileViewModel.userName ?? '';
      salesController.text = profileViewModel.specify ?? '';
      companyNameController.text = profileViewModel.companyName ?? '';
      emailController.text = profileViewModel.userEmail ?? '';

      mobileController.text = profileViewModel.userPhone ?? '';

      frequentController.text = profileViewModel.frequentFlyerNo ?? '';
      additionalController.text = profileViewModel.additionalDetails ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: const CustomText(
          text: "Profile",
          fontFamily: CustomFonts.inter,
          size: 0.065,
          color: AppColors.blackColor,
          weight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: commonScreenPadding(context),
          child: Consumer<ProfileViewModel>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        ImageOfProfile(value: value),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                  value.onEditPressed ? value.addNewImage() : null;
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(243, 231, 254, 1),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Icon(Icons.camera_alt_outlined,
                                    size: mediaquerywidth(0.06, context),
                                    color: const Color.fromRGBO(165, 128, 199, 1)),
                              ),
                            ))
                      ]),
                      const CustomSizedBoxHeight(0.02),
                      CustomText(
                        text: nameController.text,
                        fontFamily: CustomFonts.roboto,
                        size: 0.055,
                        color: AppColors.blackColor,
                        weight: FontWeight.w900,
                      ),
                      if (!value.onEditPressed)
                        ProfilepageeEditbutton(
                          ontap: () => value.editButtonPressed(),
                        ),
                      const CustomSizedBoxHeight(0.01),
                      LabeledInputField(
                        hintText: 'Name',
                        labelText: 'Name',
                        controller: nameController,
                        isEnabled: value.onEditPressed,
                      ),
                      const CustomSizedBoxHeight(0.02),
                      LabeledInputField(
                        hintText: 'Ankith Agira',
                        labelText: 'Sales Executive Name',
                        controller: salesController,
                        isEnabled: value.onEditPressed,
                      ),
                      const CustomSizedBoxHeight(0.02),
                      LabeledInputField(
                        hintText: 'Ab2C Travels',
                        labelText: 'Company Name',
                        controller: companyNameController,
                        isEnabled: value.onEditPressed,
                      ),
                      const CustomSizedBoxHeight(0.02),
                      LabeledInputField(
                        hintText: 'Abc@gmail.com',
                        labelText: 'Email',
                        controller: emailController,
                        isEnabled: false,
                        suffix: const Icon(Icons.done_rounded,
                            color: AppColors.succesIconColor),
                      ),
                      const CustomSizedBoxHeight(0.02),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomText(
                          fontFamily: CustomFonts.poppins,
                          text: 'Date of Birth',
                          size: 0.04,
                          color: AppColors.blackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.onEditPressed
                              ? value.dateSelection(FromDates.dob, context)
                              : null;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(54, 38, 8, 37)),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  (value.dob ?? "Select the date"),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Icon(Icons.calendar_month,
                                    color: AppColors.dateIconColor),
                              ]),
                        ),
                      ),
                      const CustomSizedBoxHeight(0.02),
                      LabeledInputField(
                        keyboardType: TextInputType.phone,
                        hintText: 'Enter Mobile Number',
                        labelText: 'Mobile',
                        controller: mobileController,
                        isEnabled: value.onEditPressed,
                      ),
                      const CustomSizedBoxHeight(0.02),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: CustomText(
                          fontFamily: CustomFonts.poppins,
                          text: 'Marriage anniversary',
                          size: 0.04,
                          color: AppColors.blackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          value.onEditPressed
                              ? value.dateSelection(FromDates.marriage, context)
                              : null;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(54, 38, 8, 37)),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value.newMarriageAnniversary ??
                                      "Select the date",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Icon(Icons.calendar_month,
                                    color: AppColors.dateIconColor),
                              ]),
                        ),
                      ),
                      const CustomSizedBoxHeight(0.02),
                      LabeledInputField(
                        hintText: 'Enter the Flyer No',
                        labelText: 'Frequent Flyer No',
                        controller: frequentController,
                        isEnabled: value.onEditPressed,
                      ),
                      const CustomSizedBoxHeight(0.02),
                      LabeledInputField(
                        hintText: 'Type your extra details here..',
                        labelText: 'Additional Details',
                        controller: additionalController,
                        maxlngths: 3,
                        isEnabled: value.onEditPressed,
                      ),
                      const CustomSizedBoxHeight(0.04),
                      Opacity(
                        opacity: value.onEditPressed ? 1 : .5,
                        child: CustomButton(
                          function: value.onEditPressed
                              ? () {
                                  final updatedData = {
                                    "name": nameController.text,
                                    "company_name": companyNameController.text,
                                    "email": emailController.text,
                                    "dob": value.dob,
                                    "phone": mobileController.text,
                                    "frequent_flyer_no":
                                        frequentController.text,
                                    "additional_details":
                                        additionalController.text,
                                  };
                                  context
                                      .read<ProfileViewModel>()
                                      .updateProfile(13, updatedData);
                                }
                              : () {
                               
                              },
                          text: 'Save',
                          fontSize: 0.04,
                          buttonTextColor: AppColors.whiteColor,
                          borderColor: AppColors.transparentColor,
                          fontFamily: CustomFonts.poppins,
                        ),
                      ),
                      const CustomSizedBoxHeight(0.04),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
