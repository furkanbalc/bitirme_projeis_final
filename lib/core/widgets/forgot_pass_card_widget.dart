import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';

class ForgetPassCardWidget extends StatefulWidget {
  const ForgetPassCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  State<ForgetPassCardWidget> createState() => _ForgetPassCardWidgetState();
}

class _ForgetPassCardWidgetState extends State<ForgetPassCardWidget> {
  final double _iconSize = 48;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: AppColors.purpleLighter,
        child: ListTile(
          title: Text(widget.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.blackPrimary)),
          subtitle: Text(widget.subTitle, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.greyPrimary)),
          leading: Icon(widget.icon, color: AppColors.greyPrimary, size: _iconSize),
        ),
      ),
    );
  }
}
