import 'package:flutter/material.dart';
import 'package:quote_app/util/constants/color.dart';

class FormFieldWidget extends StatelessWidget {
  final String text;
  final Icon fieldIcon;
  final TextEditingController controller;
  final String? Function(String?) validate;
  const FormFieldWidget({
    super.key,
    required this.text,
    required this.fieldIcon,
    required this.controller,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: text,
          suffixIcon: fieldIcon,
        ),
        controller: controller,
        validator: validate,
      ),
    );
  }
}
