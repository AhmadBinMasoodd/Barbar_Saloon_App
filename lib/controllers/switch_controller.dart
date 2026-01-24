import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool isOn = false.obs;

  void toggleSwitch(bool value) {
    isOn.value = value;
  }
}
