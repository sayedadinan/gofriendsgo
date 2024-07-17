import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Icon? icon;
  final Icon? prefixIcon;
  const Inputfield({
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
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(54, 38, 8, 37)),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(54, 62, 5, 61))),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        hintText: hinttext,
        prefixIcon: prefixIcon,
        suffixIcon: icon,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 183, 177, 177)),
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(90)),
      ),
      keyboardType: keyboardType,
    );
  }
}
