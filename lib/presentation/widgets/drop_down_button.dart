import 'package:flutter/material.dart';
import 'package:omar_ahmed_mentorship/model/drink.dart';

import '../../core/constants/app_colors.dart';

class DropDownButton extends StatefulWidget {
  final String label;

  const DropDownButton({super.key, required this.label});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? selectedValue;
  final List<Drink> availableDrinks = [Tea(), TurkishCoffee(), HibiscusTea()];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.label}:",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: 'Select ${widget.label.toLowerCase()}',
            hintStyle: const TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.black, width: 1.2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withAlpha(90),
                width: 1.2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            filled: true,
            fillColor: Colors.white,
            isDense: false,
          ),
          items: availableDrinks.map((Drink value) {
            return DropdownMenuItem<String>(
              value: value.name,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(value.name),
              ),
            );
          }).toList(),

          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.black,
            size: 24,
          ),
          dropdownColor: Colors.white,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
