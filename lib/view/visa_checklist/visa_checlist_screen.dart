import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/app_strings.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/view/visa_checklist_widgets/list_items.dart';

class VisaChecklistScreen extends StatelessWidget {
  const VisaChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const CommonGradientAppBar(heading: TextStrings.visaChecklist)),
      body: Padding(
        padding: EdgeInsets.all(mediaquerywidth(0.065, context)),
        child: const PackagesListView(),
      ),
    );
  }
}
