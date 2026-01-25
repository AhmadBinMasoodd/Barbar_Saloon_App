import 'package:barbar_saloon_app/screens/verification_screen.dart';
import 'package:barbar_saloon_app/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/colors.dart' show AppColors;
import '../widgets/app_bar.dart';
import '../widgets/labeled_text_field.dart';
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      appBar: const MyAppBar(title: 'Login'),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const SizedBox(height: 400),
                    CustomButton(text: 'Forget Password', onPressed: (){
                      if(emailController.text.isEmpty){

                      }else{
                        Get.to(()=>VerificationScreen(text: "", callback:(){

                        }));
                      }
                    })
                  ],
                ),
              ),
            ),
          ],
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

}
