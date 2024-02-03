import 'package:bende_fazla/product/constants/app_colors.dart';
import 'package:bende_fazla/product/extensions/paddings.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.border,
  });

  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: border,
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: context.paddings.zero,
        icon: Icon(icon, color: iconColor ?? AppColors.purplePrimary),
      ),
    );
  }
}
