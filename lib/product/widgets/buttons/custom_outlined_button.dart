import 'package:bende_fazla/product/extensions/paddings.dart';
import 'package:bende_fazla/product/extensions/text_styles.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    required this.butonColor,
    this.width,
  });

  final String buttonTitle;
  final Color butonColor;
  final double? width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(side: BorderSide(color: butonColor)),
        child: Padding(
          padding: context.paddings.verticalHigh,
          child: Text(
            buttonTitle,
            style: context.textStyles.titleMedium.copyWith(color: butonColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
