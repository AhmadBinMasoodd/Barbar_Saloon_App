import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48, // fixed height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6F45F0),
          foregroundColor: const Color(0xFFFFFCF9),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // fully rounded
          ),
          textStyle: const TextStyle(
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: 0,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
