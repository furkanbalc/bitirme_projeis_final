import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';

class CustomCenteredCircularProgress extends StatelessWidget {
  const CustomCenteredCircularProgress({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: color ?? AppColors.whiteColor));
  }
}
