import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.autofillHints,
    this.textInputAction,
    this.obscureText,
    this.hintText,
    this.labelText,
    this.suffixOnPressed,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly,
    this.autoFocus,
    this.textAlign,
    this.maxLines,
    this.maxLenght,
    this.minLines,
    this.prefixIconColor,
    this.onTap,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? suffixOnPressed;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Iterable<String>? autofillHints;
  final bool? obscureText;
  final bool? readOnly;
  final String? labelText;
  final String? hintText;
  final bool? autoFocus;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? minLines;
  final int? maxLenght;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$labelText *', style: context.textStyles.titleSmall.copyWith(color: AppColors.blackPrimary)),
        context.sizedBoxHeightLow,
        TextFormField(
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          maxLength: maxLenght,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          textInputAction: textInputAction,
          textAlign: textAlign ?? TextAlign.start,
          obscureText: obscureText ?? false,
          autofocus: autoFocus ?? false,
          readOnly: readOnly ?? false,
          style: context.textStyles.titleMedium.copyWith(color: AppColors.blackPrimary, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconColor: prefixIconColor,
            hintText: hintText,
            hintStyle: context.textStyles.titleSmall.copyWith(color: AppColors.greyPrimary),
            suffixIcon: CustomIconButton(onPressed: suffixOnPressed, icon: suffixIcon),
          ),
        ),
      ],
    );
  }
}
