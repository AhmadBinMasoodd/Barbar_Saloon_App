import 'package:auto_size_text/auto_size_text.dart';
import 'package:barbar_saloon_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'heading': 'Explore Freelancer Barbar in your Area',
      'description':
      'Quam laoreet eget vel amet enim, pretium. Pellentesque tellus erat in sed urna porttitor. Scelerisque lectus',
      'image': 'assets/images/Layer 1.png',
    },
    {
      'heading': 'Book Services Easily',
      'description':
      'Find professionals near you and book their services within a few clicks.',
      'image': 'assets/images/Frame.png',
    },
    {
      'heading': 'Start Your Journey',
      'description':
      'Sign up or log in to access all features and get started today.',
      'image': 'assets/images/Frame.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double fontSize = MediaQuery.of(context).size.width * 0.025;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F1FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF2F1FF),
        title: const Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                controller.jumpToPage(onboardingData.length - 1); // skip to last
              },
              child: AutoSizeText(
                'Skip',
                minFontSize: 16,
                maxFontSize: 28,
                style: TextStyle(
                  color: const Color(0xFF767676),
                  fontFamily: 'NunitoSans',
                  fontSize: fontSize,
                ),
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
              controller: controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  heading: onboardingData[index]['heading']!,
                  description: onboardingData[index]['description']!,
                  image: onboardingData[index]['image']!,
                );
              },
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFFFDFDFD),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Page indicator
                    SmoothPageIndicator(
                      controller: controller,
                      count: onboardingData.length,
                      effect:  ExpandingDotsEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: Color(0xFF6F45F0),
                        dotColor: Colors.grey,
                        expansionFactor:2.5,
                      ),
                    ),

                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentPage < onboardingData.length - 1) {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // Navigate to login/signup screen
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // remove default padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Image.asset(
                          currentPage == onboardingData.length - 1
                              ? 'assets/images/start_button.png'
                              : 'assets/images/next_button.png',
                          fit: BoxFit.contain,
                          height: 50,
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
