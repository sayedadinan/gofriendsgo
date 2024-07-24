import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/view_model/carosual_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeCarosualWidget extends StatelessWidget {
  const HomeCarosualWidget({
    super.key,
    required this.adController,
  });

  final PageController adController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaquerywidth(0.95, context),
      height: mediaqueryheight(0.23, context),
      child: Consumer<CarosualViewModel>(
        builder: (context, carosualViewModel, child) {
          if (carosualViewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return PageView.builder(
              controller: adController,
              itemCount: carosualViewModel.carouselsModel!.data.length,
              itemBuilder: (context, index) {
                final carosuals = carosualViewModel.carouselsModel!.data[index];
                return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://gofriendsgo.teqsuit.com/public/storage/${carosuals.image}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12)));
              },
            );
          }
        },
      ),
    );
  }
}
