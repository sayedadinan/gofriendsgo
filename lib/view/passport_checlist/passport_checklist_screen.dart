import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/passport_checklist_widgets/detailsbutton_and_amount.dart';
import 'package:gofriendsgo/widgets/passport_checklist_widgets/heading.dart';
import 'package:gofriendsgo/widgets/passport_checklist_widgets/passport_details.dart';

class PassportChecklistScreen extends StatelessWidget {
  const PassportChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
        child:
            const CommonGradientAppBar(heading: TextStrings.passportChecklist),
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
                      PassportRequirementHeading(),
                      CustomSizedBoxHeight(0.015),
                      Divider(),
                      CustomSizedBoxHeight(0.025),
                      DetailsOfPassportChecklist()
                    ],
                  ),
                ),
              ),
              const CustomSizedBoxHeight(0.04),
              const GetDetailsAndAmountInPassportCheclist(),
              const CustomSizedBoxHeight(0.04),
            ],
          ),
        ),
      ),
    );
  }
}
