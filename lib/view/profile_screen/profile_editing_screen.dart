import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_button.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/screen_padding.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/constants/text_controllers.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';
import 'package:gofriendsgo/widgets/profile_wdigets/profile_edit_button.dart';
import 'package:gofriendsgo/widgets/signup_widget/custom_field.dart';
import 'package:provider/provider.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  _ProfileEditingScreenState createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
      context.read<ProfileViewModel>().fetchProfile();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //  //   Fetch data from the provider
  //     final profileViewModel =
  //         Provider.of<ProfileViewModel>(context, listen: false);
  //     nameController.text = profileViewModel.userName ?? '';
  //     salesController.text = profileViewModel.specify ?? '';
  //     companyNameController.text = profileViewModel.companyName ?? '';
  //     emailController.text = profileViewModel.userEmail ?? '';
  //     dobController.text = profileViewModel.dob ?? '';
  //     mobileController.text = profileViewModel.userPhone ?? '';
  //     anniversayController.text = profileViewModel.specify ?? '';
  //     frequentController.text = profileViewModel.frequentFlyerNo ?? '';
  //     additionalController.text = profileViewModel.additionalDetails ?? '';
  //   });
  }

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
          child: Consumer<ProfileViewModel>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      maxRadius: 38,
                      backgroundColor: AppColors.blackColor,
                      backgroundImage: AssetImage(AppImages.onboardingFirst),
                    ),
                    const CustomSizedBoxHeight(0.02),
                    CustomText(
                      text: nameController.text,
                      fontFamily: CustomFonts.roboto,
                      size: 0.04,
                      color: AppColors.blackColor,
                      weight: FontWeight.w900,
                    ),
                    ProfilepageeEditbutton(
                      ontap: () {
                        // setState(() {
                        //   isEditing = !isEditing;
                        // });
                      },
                    ),
                    const CustomSizedBoxHeight(0.01),
                    LabeledInputField(
                      hintText: 'Name',
                      labelText: 'Name',
                      controller: nameController,
                      isEnabled: isEditing,
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Ankith Agira',
                      labelText: 'Sales Executive Name',
                      controller: salesController,
                      isEnabled: isEditing,
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Ab2C Travels',
                      labelText: 'Company Name',
                      controller: companyNameController,
                      isEnabled: isEditing,
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Abc@gmail.com',
                      labelText: 'Email',
                      controller: emailController,
                      isEnabled: isEditing,
                      suffix: const Icon(Icons.done_rounded,
                          color: AppColors.succesIconColor),
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Select the date',
                      labelText: 'Date of Birth',
                      controller: dobController,
                      isEnabled: isEditing,
                      suffix: const Icon(Icons.calendar_month,
                          color: AppColors.dateIconColor),
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Enter Mobile Number',
                      labelText: 'Mobile',
                      controller: mobileController,
                      isEnabled: isEditing,
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Select the date',
                      labelText: 'Marriage anniversary',
                      controller: anniversayController,
                      isEnabled: isEditing,
                      suffix: const Icon(Icons.calendar_month,
                          color: AppColors.dateIconColor),
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Enter the Flyer No',
                      labelText: 'Frequent Flyer No',
                      controller: frequentController,
                      isEnabled: isEditing,
                    ),
                    const CustomSizedBoxHeight(0.02),
                    LabeledInputField(
                      hintText: 'Type your extra details here..',
                      labelText: 'Additional Details',
                      controller: additionalController,
                      maxlngths: 3,
                      isEnabled: isEditing,
                    ),
                    const CustomSizedBoxHeight(0.12),
                    CustomButton(
                      function: () {
                        log(salesController.text);
                        log(companyNameController.text);
                        log(dobController.text);
                        final updatedData = {
                          "name": nameController.text,
                          "company_name": companyNameController.text,
                          "email": emailController.text,
                          "dob": dobController.text,
                          "phone": mobileController.text,
                          "frequent_flyer_no": frequentController.text,
                          "additional_details": additionalController.text,
                        };
                     context
                            .read<ProfileViewModel>()
                            .updateProfile(13, updatedData);
                        // if (isEditing) {  
                          
                        //   // context
                        //   //     .read<ProfileViewModel>()
                        //   //     .updateProfile(13,);
                        //   // Call the update function from the view model
                        //   // value.updateProfile(
                        //   //   nameController.text,
                        //   //   salesController.text,
                        //   //   companyNameController.text,
                        //   //   emailController.text,
                        //   //   dobController.text,
                        //   //   mobileController.text,
                        //   //   anniversayController.text,
                        //   //   frequentController.text,
                        //   //   additionalController.text,
                        //   // );
                        // }
                      },
                      text: 'Save',
                      fontSize: 0.04,
                      buttonTextColor: AppColors.whiteColor,
                      borderColor: AppColors.transparentColor,
                      fontFamily: CustomFonts.poppins,
                    ),
                    const CustomSizedBoxHeight(0.04),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
