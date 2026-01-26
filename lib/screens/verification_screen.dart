import 'package:barbar_saloon_app/widgets/app_bar.dart';
import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/OtpTimerController.dart' show Otptimercontroller;
import '../widgets/custom_button.dart';

class VerificationScreen extends StatelessWidget {
  final String text;
  final VoidCallback callback;


  VerificationScreen({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Otptimercontroller timeController = Get.put(Otptimercontroller());

    return Scaffold(
      appBar: const MyAppBar(title: 'Verification'),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: AppColors.primary,
        child: Column(
          children: [
            _buildHeaderText(text),

            /// WHITE CONTAINER
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildOtpFields(),
                      const SizedBox(height: 30),

                      // Timer display
                      Obx(() => Text(
                        "Resend code in ${timeController.secondsRemaining.value}s",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      )),
                      const SizedBox(height: 10),

                      // Resend button
                      Obx(() => TextButton(
                        onPressed: timeController.canResend.value
                            ? timeController.resendCode
                            : null,
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),

                      const SizedBox(height: 300),
                      CircularProgressIndicator(),


                      CustomButton(
                        text: "Verify Code",
                        onPressed: callback,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // OTP Input Fields
  Widget _buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
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

  Widget _buildHeaderText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
