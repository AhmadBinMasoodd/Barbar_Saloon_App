import 'package:barbar_saloon_app/screens/home_screen.dart';
import 'package:barbar_saloon_app/screens/onboarding_screen.dart';
import 'package:barbar_saloon_app/screens/splash_screen.dart';
import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'NunitoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.backgroundLight),
        scaffoldBackgroundColor: AppColors.backgroundLight,
      ),
      home: const OnboardingScreen(),
    );
  }
}
