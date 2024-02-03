import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class AuthTextRichButton extends StatefulWidget {
  const AuthTextRichButton({
    super.key,
    required this.buttonDesc,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String buttonDesc;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  State<AuthTextRichButton> createState() => _AuthTextRichButtonState();
}

class _AuthTextRichButtonState extends State<AuthTextRichButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text.rich(
        TextSpan(
          text: widget.buttonDesc,
          style: context.textStyles.titleMedium.copyWith(color: AppColors.greyPrimary),
          children: [
            TextSpan(
              text: widget.buttonLabel,
              style: context.textStyles.titleMedium.copyWith(
                color: AppColors.purplePrimary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
