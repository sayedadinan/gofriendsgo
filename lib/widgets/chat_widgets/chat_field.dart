import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/widgets/chat_widgets/gradient_icon.dart';

class ChatField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Icon? icon;
  final Icon? prefixIcon;
  const ChatField({
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(52),
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(54, 38, 8, 37)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(52)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(52),
                    borderSide: BorderSide.none),
                labelText: label,
                hintText: hinttext,
                prefixIcon: prefixIcon,
                suffixIcon: icon,
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 183, 177, 177)),
                labelStyle: const TextStyle(color: Colors.black),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(52)),
              ),
              keyboardType: keyboardType,
            ),
          ),
          IconButton(
            icon: GradientIcon(
              icon: Icons.attach_file,
              size: mediaquerywidth(0.06, context),
              gradient: const LinearGradient(
                  colors: AppColors.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            onPressed: () {
              showAttachmentOptions(context);
              // Handle attach file action
            },
          ),
          IconButton(
            icon: GradientIcon(
              icon: Icons.person_add_alt_1_outlined,
              size: mediaquerywidth(0.06, context),
              gradient: const LinearGradient(
                  colors: AppColors.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            onPressed: () {
              // Handle select contact action
            },
          ),
        ],
      ),
    );
  }
}

void showAttachmentOptions(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.only(bottom: mediaqueryheight(0.13, context)),
        alignment: Alignment.bottomCenter,
        backgroundColor: AppColors.blackColor,
        contentPadding: EdgeInsets.zero,
        content: Padding(
          padding: EdgeInsets.only(top: mediaqueryheight(0.03, context)),
          child: SizedBox(
            width: 340,
            height: 250,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              // mainAxisSpacing: 8.0,
              // crossAxisSpacing: 8.0,
              children: [
                _buildGridOption(context, Icons.contact_page, 'Document',
                    Color.fromARGB(255, 61, 18, 181)),
                _buildGridOption(context, Icons.person, 'Contact', Colors.blue),
                _buildGridOption(
                    context, Icons.camera_enhance, 'Camera', Colors.green),
                _buildGridOption(context, Icons.photo, 'Gallery', Colors.pink),
                _buildGridOption(
                    context, Icons.headphones, 'Audio', Colors.blue),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildGridOption(
    BuildContext context, IconData icon, String label, Color color) {
  return InkWell(
    onTap: () {
      // Handle the action for the selected option
      Navigator.of(context).pop();
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Icon(icon, color: Colors.white, size: 30.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
