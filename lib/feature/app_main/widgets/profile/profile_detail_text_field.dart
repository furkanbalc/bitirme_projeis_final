import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileDetailTextField extends StatelessWidget {
  const ProfileDetailTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.readOnly,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String label;
  final bool? readOnly;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label *'),
        TextField(
          controller: controller,
          readOnly: readOnly ?? false,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            fillColor: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
