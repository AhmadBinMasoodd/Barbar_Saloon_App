import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';

class SplashLauncher extends StatefulWidget {
  const SplashLauncher({super.key});

  @override
  State<SplashLauncher> createState() => _SplashLauncherState();
}

class _SplashLauncherState extends State<SplashLauncher> {
  @override
  void initState() {
    super.initState();

    // Ensure navigation happens after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) { // check if widget is still in tree
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
