import 'package:flutter/material.dart';
import '../config/colors.dart';

class customDialogBox extends StatelessWidget {
  final String imagePath;      // Path to PNG image
  final String title;          // Dialog title
  final String message;        // Dialog message
  final String buttonText;     // Button text
  final VoidCallback onPressed; // Button action

  const customDialogBox({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image Circle
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Message
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textGrey,
                ),
              ),

              const SizedBox(height: 25),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
