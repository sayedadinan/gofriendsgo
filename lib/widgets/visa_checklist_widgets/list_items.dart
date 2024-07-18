import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/visa_checlist_sample_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/visa_checklist_screen/visa_checklist_details_screen.dart';


class PackagesListView extends StatelessWidget {
  const PackagesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: visaCheckListCategoriesModelList.length,
      itemBuilder: (context, index) {
        final country = visaCheckListCategoriesModelList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: mediaqueryheight(0.025, context)),
          child: GestureDetector(
            onTap: () => PageNavigations().push(const VisaChecklistDetailsScreen()),
            child: Container(
              width: double.infinity,
              height: mediaqueryheight(0.17, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                      fit: BoxFit.cover,
                      image: NetworkImage(country.imageUrl))),
              child: Center(
                child: CustomText(
                  text: "Visa for ${country.countryName}",
                  fontFamily: CustomFonts.roboto,
                  size: 0.063,
                  color: AppColors.whiteColor,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
