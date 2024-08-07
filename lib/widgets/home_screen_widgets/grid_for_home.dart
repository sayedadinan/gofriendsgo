// ignore_for_file: library_private_types_in_public_api
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/services/api/app_apis.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/view_model/service_viewmodel.dart';
import 'package:provider/provider.dart';

class GridForHomeScreen extends StatefulWidget {
  const GridForHomeScreen({super.key});

  @override
  _GridForHomeScreenState createState() => _GridForHomeScreenState();
}

class _GridForHomeScreenState extends State<GridForHomeScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(236, 228, 255, 1),
        ),
        height: _isExpanded
            ? mediaqueryheight(0.46, context)
            : mediaqueryheight(0.25, context),
        child: Padding(
          padding: EdgeInsets.only(
            top: mediaqueryheight(0.02, context),
            bottom: mediaqueryheight(0.02, context),
          ),
          child: Consumer<ServiceViewModel>(
              builder: (context, serviceViewModel, child) {
            if (serviceViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _isExpanded
                    ? serviceViewModel.services.length
                    : serviceViewModel.services.length < 8
                        ? serviceViewModel.services.length
                        : 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  final gridItems = serviceViewModel.services[index];
                  if (index < 7 || (_isExpanded && index < 14)) {
                    // For the first 7 items or more items if expanded
                    return GestureDetector(
                      onTap: () {
                        // PageNavigations().push(const ChatScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: mediaquerywidth(0.14, context),
                            height: mediaqueryheight(0.06, context),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: API.baseImageUrl + gridItems.image,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // child: Image.network(
                              //     fit: BoxFit.cover,
                              //     API.baseImageUrl + gridItems.image),
                            ),
                          ),
                          SizedBox(
                            width: mediaquerywidth(0.16, context),
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: gridItems.name,
                              fontFamily: CustomFonts.poppins,
                              size: 0.03,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            width: mediaquerywidth(0.14, context),
                            height: mediaquerywidth(0.14, context),
                            child: const Center(
                              child: Icon(Icons.grid_view,
                                  color: AppColors.blackColor),
                            ),
                          ),
                          SizedBox(
                            width: mediaquerywidth(0.16, context),
                            child: const CustomText(
                              textAlign: TextAlign.center,
                              text: 'View More',
                              fontFamily: CustomFonts.poppins,
                              size: 0.03,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
