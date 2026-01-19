import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: AppColors.textBlack,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? isHidden : false,

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint,

            hintStyle: const TextStyle(
              fontSize: 20,
              color: AppColors.textGreyMedium,
            ),

            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.borderLight,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
              onPressed: () =>
                  setState(() => isHidden = !isHidden),
              icon: Icon(
                isHidden
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColors.primary,
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}
