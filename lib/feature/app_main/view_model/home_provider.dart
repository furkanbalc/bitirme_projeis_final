import 'package:bende_fazla/feature/app_main/repository/datas/home_ads_items.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final List<String> items = HomeAdsItems().items;
  int carousalCurrentIndex = 0;
  String userName = '';

  void setPageIndicator(int index) {
    carousalCurrentIndex = index;
    notifyListeners();
  }
}
