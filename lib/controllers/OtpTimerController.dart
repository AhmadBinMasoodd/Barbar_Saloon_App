import 'dart:async';
import 'package:get/get.dart';
class Otptimercontroller extends GetxController{
  RxInt secondsRemaining=60.obs;
  RxBool canResend=false.obs;
  Timer? timer;
  @override
  void onInit(){
    startTimer();
    super.onInit();
  }
  void startTimer(){
    secondsRemaining.value = 60;
    canResend.value = false;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value == 0) {
        canResend.value = true;
        timer.cancel();
      } else {
        secondsRemaining.value--;
      }
    });
  }
  void resendCode(){
    startTimer();
  }
  @override
  void onClose(){
    timer?.cancel();
    super.onClose();
  }
}