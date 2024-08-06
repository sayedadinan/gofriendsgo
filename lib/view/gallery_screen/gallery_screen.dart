import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.09, context)),
          child: const CommonGradientAppBar(
              fromBottomNav: false, heading: 'Gallery')),
      body: GridView.custom(
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
          childCount: 12,
          (context, index) => Container(
            width: 34,
            height: mediaqueryheight(0.18, context),
            color: const Color.fromARGB(255, 205, 199, 182),
          ),
        ),
      ),
    );
  }
}
