import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';

class ProgressIndicatorOnDrawer extends StatelessWidget {
  const ProgressIndicatorOnDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: mediaqueryheight(0.01, context),
      value: 0.4,
      borderRadius: BorderRadius.circular(90),
      valueColor: const AlwaysStoppedAnimation(Color.fromRGBO(61, 9, 174, 1)),
    );
  }
}
