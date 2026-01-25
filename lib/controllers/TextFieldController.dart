import 'package:get/get.dart';
class TextFieldController extends GetxController{
  RxBool isHidden=true.obs;
  void toggleHidden(){
    isHidden.value=!isHidden.value;
  }
}