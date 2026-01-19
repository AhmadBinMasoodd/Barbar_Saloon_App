import 'package:flutter/material.dart';

class CustomDividerWithText extends StatelessWidget {
  final String text;
  final Color lineColor;
  final Color textColor;
  final double thickness;
  final double fontSize;

  const CustomDividerWithText({
    super.key,
    this.text = "Or Sign Up with",
    this.lineColor = Colors.grey,
    this.textColor = Colors.grey,
    this.thickness = 1,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: thickness,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
