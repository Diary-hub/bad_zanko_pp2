import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.obscureText,
      required this.label,
      required this.controller,
      required this.icon,
      this.width = 200,
      required this.sW});

  final bool obscureText;
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final double width;
  final double sW;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sW,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.blue),
            hintText: label,
            prefixIcon: icon),
      ),
    );
  }
}
