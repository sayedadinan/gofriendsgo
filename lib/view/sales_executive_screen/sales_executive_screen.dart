import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/sales_executive_widgets/first_section.dart';
import 'package:gofriendsgo/widgets/sales_executive_widgets/second_section.dart';
import 'package:gofriendsgo/widgets/sales_executive_widgets/third_section.dart';

class SalesExecutiveScreen extends StatelessWidget {
  const SalesExecutiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child:
              const CommonGradientAppBar(heading: TextStrings.salesExecutive)),
      body: Column(
        children: [
          const CustomSizedBoxHeight(0.015),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: mediaqueryheight(0.02, context),
                horizontal: mediaquerywidth(0.04, context)),
            child: const Column(
              children: [
                FirstSectionInSalesExecutiveSection(),
                CustomSizedBoxHeight(0.04),
                SecondSection(),
                CustomSizedBoxHeight(0.04),
                ThirdSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

