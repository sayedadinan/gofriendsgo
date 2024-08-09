import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/view_model/gallery_viewmodel.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    context.read<GalleryViewModel>().fetchGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.09, context)),
          child: const CommonGradientAppBar(
              fromBottomNav: false, heading: 'Gallery')),
      body: Consumer<GalleryViewModel>(builder: (context, value, child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
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
            childCount: value.galleryResponse!.data.galleries.length,
            (context, index) => Container(
              width: 34,
              height: mediaqueryheight(0.18, context),
              color: const Color.fromARGB(255, 205, 199, 182),
            ),
          ),
        );
      }),
    );
  }
}
