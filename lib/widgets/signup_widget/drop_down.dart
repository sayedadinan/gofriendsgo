import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';

import '../../utils/constants/sizedbox.dart';

class StaticDropdownField extends StatefulWidget {
  const StaticDropdownField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StaticDropdownFieldState createState() => _StaticDropdownFieldState();
}

class _StaticDropdownFieldState extends State<StaticDropdownField> {
  String? selectedOption;
  final List<String> options = [
    'Sales Person',
    'Social Media',
    'Seminar',
    'Friend',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CustomText(
              color: AppColors.blackColor,
              fontFamily: CustomFonts.poppins,
              size: 0.04,
              text: 'Where Did You Hear About Us',
            ),
          ],
        ),
        const CustomSizedBoxHeight(0.01),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            prefixIcon: const Icon(Icons.waving_hand_outlined),
            hintText: 'Choose an option',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          value: selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
