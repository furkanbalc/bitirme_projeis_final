import 'package:bende_fazla/product/extensions/paddings.dart';
import 'package:bende_fazla/product/extensions/text_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonWidth,
    this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final double? buttonWidth;
  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        child: Padding(
          padding: context.paddings.verticalHigh,
          child: Text(text),
        ),
      ),
    );
  }
}
