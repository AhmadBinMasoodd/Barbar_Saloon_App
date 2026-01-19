import 'package:flutter/material.dart';

class LabeledDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final String hint;
  final Function(String) onChanged;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.hint,
    required this.onChanged,
  });

  @override
  State<LabeledDropdown> createState() => _LabeledDropdownState();
}

class _LabeledDropdownState extends State<LabeledDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE1E1E1),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              hint: Text(widget.hint),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged(value!);
              },
              items: widget.items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
