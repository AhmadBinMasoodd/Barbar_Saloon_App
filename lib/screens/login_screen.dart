import 'package:barbar_saloon_app/controllers/switch_controller.dart';
import 'package:barbar_saloon_app/screens/forget_password_screen.dart';
import 'package:barbar_saloon_app/screens/signup_screen.dart';
import 'package:barbar_saloon_app/screens/verification_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_divider_with_text.dart';
import '../widgets/labeled_dropdown.dart';
import '../widgets/labeled_phone_field.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(title: 'Login'),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          children: [
            _buildHeaderText(),
            // White container
            Expanded(
              child: Container(
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
                        label: 'Email',
                        hint: 'Enter your email',
                        controller: emailController,
                        isEmail: true,
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
                    _forgetPassword(false),
                    _formField(CustomButton(text: "Login", onPressed: () {})),
              
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _forgetPassword(bool isSave) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
              Transform.scale(
                scale: 0.7, // try 0.6 – 0.8
                child: Obx(() => Switch(
                  value: switchController.isOn.value,
                  onChanged: switchController.toggleSwitch,
                  activeColor: AppColors.primary,
                  activeTrackColor: AppColors.primary.withOpacity(.4),
                  inactiveThumbColor: AppColors.switchText,
                  inactiveTrackColor: AppColors.switchText.withOpacity(.5),
                )),
              ),
              Text(
                'Save Me',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Nunito Sans',
                  color: AppColors.switchText,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Get.to(()=>ForgetPasswordScreen());
            },
            child: const Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito Sans',
                color: AppColors.buttonBackground,
              ),
            ),
          ),
        ],
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
          'Login to access all the features in Barber Shop',
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
          text: "Don't have an account? ",
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: "Sign up",
              style: const TextStyle(
                color: Color(0xFF6F45F0),
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: navigate to login page
                  Get.to(()=>SignupScreen());
                },
            ),
          ],
        ),
      ),
    );
  }
}
