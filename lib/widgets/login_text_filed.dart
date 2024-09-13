import 'package:flutter/material.dart';

class LoginTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String labelTextForField;
  final FormFieldValidator<String>? validator;
  final bool hasAsterisks;
  const LoginTextFiled({
    super.key,
    required this.controller,
    required this.labelTextForField,
    required this.validator,
    this.hasAsterisks = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterisks,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          labelText: labelTextForField, border: const OutlineInputBorder()),
    );
  }
}
