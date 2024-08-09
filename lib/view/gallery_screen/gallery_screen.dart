import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gofriendsgo/services/api/app_apis.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/view_model/gallery_viewmodel.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.09, context)),
          child: const CommonGradientAppBar(
              fromBottomNav: false, heading: 'Gallery')),
      body: Consumer<GalleryViewModel>(
        builder: (context, value, child) {
          return GridView.custom(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 17,
              crossAxisSpacing: 16,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 2),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                childCount: value.galleryResponse?.data.galleries.length,
                (context, index) {
              final galleryItems = value.galleryResponse?.data.galleries[index];
              return Container(
                // width: 34,
                height: mediaqueryheight(0.18, context),
                color: const Color.fromARGB(255, 205, 199, 182),
                child: CachedNetworkImage(
                  imageUrl: API.baseImageUrl + galleryItems!.image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.goFriendsGoLogo),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
