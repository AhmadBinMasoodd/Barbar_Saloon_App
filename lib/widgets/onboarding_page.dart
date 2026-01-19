import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String heading;
  final String description;
  final String image;
  const OnboardingPage({
    super.key,
    required this.heading,
    required this.description,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Image
        Expanded(
          flex: 6, // top portion
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ),

        // Bottom Container (texts)
        Expanded(
          flex: 4, // bottom portion
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFDFDFD),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  heading,
                  minFontSize: 30,
                  maxFontSize: 38,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                AutoSizeText(
                  description,
                  minFontSize: 22,
                  maxFontSize: 30,

                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
