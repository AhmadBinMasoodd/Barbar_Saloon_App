import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_page.dart';
import '../config/colors.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingScreenController());

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context).size.width * 0.025;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundLight,
        actions: [
          TextButton(
            onPressed: controller.skipToLast,
            child: AutoSizeText(
              'Skip',
              minFontSize: 16,
              maxFontSize: 28,
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onboardingData.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                final data = controller.onboardingData[index];
                return OnboardingPage(
                  heading: data.heading,
                  description: data.description,
                  image: data.image,
                );
              },
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.backgroundWhite,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: controller.onboardingData.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.greyLight,
                    ),
                  ),

                  Obx(() => SizedBox(

                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.currPage.value ==
                            controller.onboardingData.length - 1) {
                          Get.to(() => SignupScreen());
                        } else {
                          controller.nextPage();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Image.asset(
                        controller.currPage.value ==
                            controller.onboardingData.length - 1
                            ? 'assets/images/start_button.png'
                            : 'assets/images/next_button.png',
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
