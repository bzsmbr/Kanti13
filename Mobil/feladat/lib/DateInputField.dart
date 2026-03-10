import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String? Function(String?) validator;

  const DateInputField({
    super.key,
    required this.controller,
    required this.onTap,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: "Válassz dátumot",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      validator: validator,
    );
  }
}