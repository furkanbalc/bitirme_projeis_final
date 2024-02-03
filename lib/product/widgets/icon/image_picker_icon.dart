import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:bende_fazla/product/widgets/buttons/index.dart';
import 'package:flutter/widgets.dart';

class ImagePickerIcon extends StatelessWidget {
  const ImagePickerIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          onPressed: onTap,
          icon: icon,
          iconColor: AppColors.purplePrimary,
          border: Border.all(color: AppColors.purplePrimary.withOpacity(0.2), width: 2),
        ),
        context.sizedBoxHeightLow,
        Text(text, style: const TextStyle(color: AppColors.greyPrimary)),
      ],
    );
  }
}
