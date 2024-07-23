import 'package:flutter/material.dart';
import 'package:gofriendsgo/model/cab_rates_model.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/cab_rates/extra_notes.dart';
import 'package:gofriendsgo/widgets/cab_rates/get_details_button.dart';
import 'package:gofriendsgo/widgets/cab_rates/service_details.dart';
import 'package:gofriendsgo/widgets/cab_rates/title.dart';
import 'package:gofriendsgo/widgets/cab_rates/vehile_and_km_heading.dart';

class CabRatesScreen extends StatelessWidget {
  const CabRatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: const CommonGradientAppBar(heading: "Cab Rates",fromBottomNav: false,)),
      body: ListView.builder(
        itemCount: cabRatesModelList.length,
        itemBuilder: (context, index) {
          final serviceDetails = cabRatesModelList[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaquerywidth(0.04, context),
                vertical: mediaqueryheight(0.02, context)),
            child: Material(
              elevation: 10,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(mediaqueryheight(0.02, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSizedBoxHeight(0.02),
                      CabRatesTitle(serviceDetails: serviceDetails),
                      const CustomSizedBoxHeight(0.015),
                      const Divider(),
                      const CustomSizedBoxHeight(0.015),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColors.backgroundColor),
                            color: AppColors.whiteColor),
                        child: Column(
                          children: [
                            const VehicleAndKmHeading(),
                            VehicleServiceDetails(
                                serviceDetails: serviceDetails),
                            ExtraNoteInCabRates(serviceDetails: serviceDetails),
                            const GetDetailsButtonInCabRates()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
