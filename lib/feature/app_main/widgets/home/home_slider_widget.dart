import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.paddings.horizontalHigh,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textStyles.titleMedium,
        ),
      ),
    );
  }
}
