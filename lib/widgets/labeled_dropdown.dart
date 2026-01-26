import 'package:barbar_saloon_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabeledDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String hint;
  final RxString selectedValue; // Use RxString from GetX
  final Function(String) onChanged;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.hint,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderLight, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue.value == '' ? null : selectedValue.value,
              hint: Text(hint),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (value) {
                selectedValue.value = value!; // Update RxString
                onChanged(value); // Optional callback
              },
              items: items
                  .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
                  .toList(),
            ),
          ),
        )),
      ],
    );
  }
}
