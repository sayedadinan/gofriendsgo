import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widgets/back_button.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widgets/circle_avatar_drawer.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widgets/drawer_list_items.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widgets/personal_detials.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widgets/profile_completion.dart';
import 'package:gofriendsgo/widgets/home_screen_widgets/drawer_widgets/progress_indicator.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(children: [
            SizedBox(
              width: double.infinity,
              height: mediaqueryheight(0.36, context),
            ),
            const BackButtonOnDrawer(),
            Positioned(
                child: Padding(
              padding: EdgeInsets.only(
                  left: 10, right: 10, top: mediaqueryheight(0.13, context)),
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  height: mediaqueryheight(0.2, context),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DrawerCircleAvatar(),
                            CustomSizedBoxWidth(0.03),
                            PersonalDetails(),
                            Spacer(),
                            Icon(Icons.edit)
                          ],
                        ),
                        CustomSizedBoxHeight(0.02),
                        ProgressIndicatorOnDrawer(),
                        CustomSizedBoxHeight(0.01),
                        ProfileCompletionStatus()
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ]),
          const DrawerListItems()
       
        ],
      ),
    );
  }
}
