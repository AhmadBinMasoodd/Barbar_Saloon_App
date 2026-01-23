import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/onboardScreen_info.dart';

class OnboardingScreenController extends GetxController{
  final PageController pageController=PageController();
  var currPage=0.obs;
  final List<OnboardScreenInfo> onboardingData = [
    OnboardScreenInfo(
      heading: 'Explore Freelancer Barber in your Area',
      description:
      'Quam laoreet eget vel amet enim, pretium. Pellentesque tellus erat in sed urna porttitor. Scelerisque lectus',
      image: 'assets/images/Layer 1.png',
    ),
    OnboardScreenInfo(
      heading: 'Book Services Easily',
      description:
      'Find professionals near you and book their services within a few clicks.',
      image: 'assets/images/Frame.png',
    ),
    OnboardScreenInfo(
      heading: 'Start Your Journey',
      description:
      'Sign up or log in to access all features and get started today.',
      image: 'assets/images/Frame.png',
    ),
  ];
  void onPageChanged(int index){
    currPage.value=index;
  }
  void nextPage(){
    if (currPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
  void skipToLast(){
    pageController.jumpToPage(onboardingData.length-1);
  }
}