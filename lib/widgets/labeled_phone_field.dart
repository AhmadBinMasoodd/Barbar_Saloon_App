import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LabeledPhoneField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const LabeledPhoneField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  @override
  State<LabeledPhoneField> createState() => _LabeledPhoneFieldState();
}

class _LabeledPhoneFieldState extends State<LabeledPhoneField> {
  String countryCode = "+92"; // default country code

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const SizedBox(height: 8),
        Row(
          children: [
            // COUNTRY CODE PICKER
            CountryCodePicker(
              onChanged: (code) {
                setState(() {
                  countryCode = code.dialCode ?? "+92";
                });
              },
              initialSelection: 'PK',
              favorite: const ['+92', 'US', 'IN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              textStyle: const TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 16,
              ),
              padding: EdgeInsets.zero,
            ),

            const SizedBox(width: 10),

            // PHONE NUMBER TEXT FIELD
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(fontSize: 16),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.borderLight,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
