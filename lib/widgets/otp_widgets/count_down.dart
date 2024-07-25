import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

class OtpCountDown extends StatefulWidget {
  const OtpCountDown({
    super.key,
  });

  @override
  State<OtpCountDown> createState() => _OtpCountDownState();
}

class _OtpCountDownState extends State<OtpCountDown> {
  int count = 20;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (count > 0) {
        setState(() {
          count--;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return count == 0
        ? Row(
            children: [
              const CustomText(
                fontFamily: CustomFonts.poppins,
                text: 'I didn\'t recieve a code',
                size: 0.04,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    count = 20;
                  });
                },
                child: const CustomText(
                  fontFamily: CustomFonts.poppins,
                  text: ' Resend',
                  weight: FontWeight.w600,
                  size: 0.04,
                  color: Colors.black,
                ),
              ),
            ],
          )
        : CustomText(
            fontFamily: CustomFonts.poppins,
            text: 'Send code again   00:$count  ',
            size: 0.04,
            color: Colors.black,
          );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
