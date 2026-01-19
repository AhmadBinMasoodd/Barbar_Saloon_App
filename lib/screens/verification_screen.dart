import 'package:barbar_saloon_app/widgets/app_bar.dart';
import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Verification'),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeaderText(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    _buildOtpFields(),

                    const SizedBox(height: 30),

                    CustomButton(
                      text: "Verify Code",
                      onPressed: () {
                        print("Code Verified");
                      },
                    ),

                    const SizedBox(height: 25),

                    _buildResendText(context),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header Text
  Widget _buildHeaderText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: const Text(
        "We've sent a verification code to\n1253 2456 2529",
        style: TextStyle(
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // OTP Input Fields
  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 50,
          height: 55,
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: "",
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  // Resend Code
  Widget _buildResendText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Didn't receive code? ",
        style: const TextStyle(color: Colors.black87, fontSize: 14),
        children: [
          TextSpan(
            text: "Resend",
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("Code resent");
              },
          ),
        ],
      ),
    );
  }
}
