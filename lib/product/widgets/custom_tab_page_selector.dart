import 'package:bende_fazla/product/constants/index.dart';
import 'package:flutter/material.dart';

class CustomTabPageSelector extends StatefulWidget {
  const CustomTabPageSelector({
    super.key,
    required this.selectedIndex,
    required this.tabLenght,
    this.indicatorSize,
  });
  final int selectedIndex;
  final int tabLenght;
  final double? indicatorSize;

  @override
  State<CustomTabPageSelector> createState() => _CustomTabPageSelectorState();
}

class _CustomTabPageSelectorState extends State<CustomTabPageSelector> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabLenght, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomTabPageSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  late final TabController _tabController;
  final double _defaultIndicatorSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
      indicatorSize: widget.indicatorSize ?? _defaultIndicatorSize,
      color: AppColors.greyLighter,
      selectedColor: AppColors.purplePrimary,
      borderStyle: BorderStyle.none,
    );
  }
}
