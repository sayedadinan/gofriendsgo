import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/visa_checklist/appbar.dart';
import 'package:gofriendsgo/widgets/visa_checklist/button_and_amount.dart';
import 'package:gofriendsgo/widgets/visa_checklist/heading_and_subheading.dart';
import 'package:gofriendsgo/widgets/visa_checklist/package_details.dart';

class VisaChecklistScreen extends StatelessWidget {
  const VisaChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
        child: const VisaCheckListAppbar(),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: mediaqueryheight(0.03, context),
            left: mediaquerywidth(0.05, context),
            right: mediaquerywidth(0.05, context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: AppColors.blackColor),
                  ],
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(mediaqueryheight(0.02, context)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSizedBoxHeight(0.02),
                      VisaRequirementHeading(),
                      CustomSizedBoxHeight(0.015),
                      Divider(),
                      CustomSizedBoxHeight(0.025),
                      VisaChecklistSubHeading(),
                      Divider(),
                      CustomSizedBoxHeight(0.03),
                      HeadingAndDetails(),
                    ],
                  ),
                ),
              ),
              const CustomSizedBoxHeight(0.04),
              const GetDetailsAndAmount(),
              const CustomSizedBoxHeight(0.04),
            ],
          ),
        ),
      ),
    );
  }
}
