import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.decoration,
    this.color,
    this.fontSize,
  });

  final TextDecoration? decoration;
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: context.textStyles.titleMedium.copyWith(
          color: color ?? AppColors.purplePrimary,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          decoration: decoration,
        ),
      ),
    );
  }
}
