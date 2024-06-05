import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    this.width = 100,
    this.height = 40,
    required this.onPressed,
    required this.text,
    this.style,
    this.styleText = const TextStyle(),
  });

  final double width;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final ButtonStyle? style;
  final TextStyle styleText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(
          text,
          style: styleText,
        ),
      ),
    );
  }
}
