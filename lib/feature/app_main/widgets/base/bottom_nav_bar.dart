import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/app_main/view_model/base_provider.dart';
import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/mixin/navigate_manager.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget with NavigatorManager {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<BaseProvider>();
    var watch = context.watch<BaseProvider>();
    return NavigationBar(
      elevation: 0,
      selectedIndex: watch.selectedIndex,
      backgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.purpleLight,
      onDestinationSelected: (value) {
        value == 2 ? navigatePushNamed(context, Routes.add) : read.onDestinationSelected(value);
      },
      destinations: read.items,
    );
  }
}
