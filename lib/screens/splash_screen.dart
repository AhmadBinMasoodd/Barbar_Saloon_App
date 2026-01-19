import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.08;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Container(
          child: AutoSizeText(
            'LOGO',
            minFontSize: 30,
            maxFontSize: 60,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'NunitoSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
