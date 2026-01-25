import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/TextFieldController.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
  });

  // one controller per password field
  final TextFieldController tfController =
  Get.put(TextFieldController(), tag: UniqueKey().toString());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textBlack,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),

        /// 🔐 PASSWORD FIELD (Obx REQUIRED)
        if (isPassword)
          Obx(() => TextFormField(
            controller: controller,
            obscureText: tfController.isHidden.value,
            decoration: _decoration(
              hint,
              IconButton(
                onPressed: tfController.toggleHidden,
                icon: Icon(
                  tfController.isHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.primary,
                ),
              ),
            ),
          ))

        /// 📝 NORMAL FIELD (NO Obx)
        else
          TextFormField(
            controller: controller,
            decoration: _decoration(hint, null),
          ),
      ],
    );
  }

  InputDecoration _decoration(String hint, Widget? suffixIcon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 20,
        color: AppColors.textGreyMedium,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderLight, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      suffixIcon: suffixIcon,
    );
  }
}
