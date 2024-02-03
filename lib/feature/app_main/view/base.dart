import 'package:bende_fazla/feature/app_main/widgets/base/bottom_nav_bar.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/extensions/index.dart';
import 'package:flutter/material.dart';

part '../widgets/base/base_appbar.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _BaseAppBar(),
      body: Padding(
        padding: context.paddings.horizontalHigh,
        child: context.providers.watchBase.body(context),
      ),

      /// Bottom Nav Bar
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
