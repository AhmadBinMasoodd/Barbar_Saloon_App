import 'package:barbar_saloon_app/screens/login_screen.dart';
import 'package:barbar_saloon_app/screens/verification_screen.dart';
import 'package:barbar_saloon_app/widgets/app_bar.dart';
import 'package:barbar_saloon_app/widgets/labeled_phone_field.dart';
import 'package:barbar_saloon_app/widgets/labeled_text_field.dart';
import 'package:barbar_saloon_app/widgets/social_buttons.dart';
import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_divider_with_text.dart';
import '../widgets/labeled_dropdown.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: const MyAppBar(title: 'Signup'),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeaderText(),

              // White container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    _formField(
                      LabeledTextField(
                        label: 'Full Name',
                        hint: 'Enter your full name',
                        controller: nameController,
                      ),
                    ),
                    _formField(
                      LabeledTextField(
                        label: 'Email',
                        hint: 'Enter your email',
                        controller: emailController,
                        isEmail: true,
                      ),
                    ),
                    _formField(
                      LabeledPhoneField(
                        label: 'Phone Number',
                        hint: 'Enter your number',
                        controller: phoneController,
                      ),
                    ),
                    _formField(
                      LabeledDropdown(
                        label: "Gender",
                        hint: "Select Gender",
                        items: const ["Male", "Female", "Other"],
                        onChanged: print,
                      ),
                    ),
                    _formField(
                      LabeledTextField(
                        label: 'Password',
                        hint: 'Enter your password',
                        controller: passwordController,
                        isPassword: true,
                      ),
                    ),

                    _formField(CustomButton(text: "Signup", onPressed: () {
                        Get.to(()=>VerificationScreen(text: "We've sent a verification code to\n1253 2456 2529", callback: (){

                        }));
                    })),

                    _formField(
                      const CustomDividerWithText(
                        text: "Continue with",
                        lineColor: Colors.black26,
                        textColor: Colors.black54,
                        thickness: 2,
                        fontSize: 16,
                      ),
                    ),

                    _formField(const SocialLoginSection()),

                    const SizedBox(height: 10),

                    _buildLoginText(context),
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SizedBox(
        width: 400, // Adjust this value based on your screen size
        child: const Text(
          'Sign up to access all the features in Barber Shop',
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Field Wrapper
  Widget _formField(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: child,
    );
  }

  // "Already have an account? Login"
  Widget _buildLoginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: "Login",
              style: const TextStyle(
                color: Color(0xFF6F45F0),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: navigate to login page
                  Get.to(()=>LoginScreen());
                },
            ),
          ],
        ),
      ),
    );
  }
}
