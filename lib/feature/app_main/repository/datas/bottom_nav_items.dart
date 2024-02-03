import 'package:bende_fazla/product/constants/index.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:flutter/material.dart';

class BottomBarViews {
  late final List<NavigationDestination> _views;
  List<NavigationDestination> get views => _views;

  BottomBarViews() {
    _views = [
      NavigationDestination(
        icon: const Icon(AppIcons.kHomeIcon),
        label: AppNavBarItems.home.value,
      ),
      NavigationDestination(
        icon: const Icon(AppIcons.kGiftIcon),
        label: AppNavBarItems.product.value,
      ),
      NavigationDestination(
        icon: const Icon(AppIcons.kAddSquareIcon),
        label: AppNavBarItems.add.value,
      ),
      NavigationDestination(
        icon: const Icon(AppIcons.kMessageIcon),
        label: AppNavBarItems.message.value,
      ),
      NavigationDestination(
        icon: const Icon(AppIcons.kUserIcon),
        label: AppNavBarItems.profile.value,
      ),
    ];
  }
}
