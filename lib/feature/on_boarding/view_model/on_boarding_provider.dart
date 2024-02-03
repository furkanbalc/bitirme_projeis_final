import 'package:bende_fazla/feature/on_boarding/model/on_boarding_items.dart';
import 'package:bende_fazla/feature/on_boarding/model/on_boarding_model.dart';
import 'package:bende_fazla/product/enums/index.dart';
import 'package:bende_fazla/product/local_storage/shared_manager.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier with NavigatorManager {
  OnBoardingProvider() {
    appInit();
  }

  /// Variables
  late final PageController pageController;
  late final List<OnBoardingModel> items;
  late final SharedManager sharedManager;
  bool isOnboardStatus = false;
  int selectedIndex = 0;

  /// Methods
  bool get isLastPage => _lastIndex == selectedIndex;
  bool get isFirstPage => selectedIndex == 0;

  int get _nextIndex => selectedIndex + 1;
  int get _prevIndex => selectedIndex - 1;
  int get _lastIndex => items.length - 1;

  animateToNextPage() => _animateToPage(_nextIndex);
  animateToPrevPage() => _animateToPage(_prevIndex);
  animateToLastPage() => _animateToPage(_lastIndex);

  //**
  // app init
  // */
  Future<void> appInit() async {
    sharedManager = SharedManager();
    items = OnBoardingItems().onBoarditems;
    pageController = PageController(initialPage: 0);
  }

  //**
  // Initializes the sharedManager and saves the onboard status to memory
  // */
  Future<void> _sharedInitAndSave() async {
    await sharedManager.init();
    sharedManager.saveBool(AppSharedKeys.onboard, isOnboardStatus);
  }

  //**
  // after displaying the onboard screen, the status was set to true and the
  // shared preference was saved if the onboard screen is shown, it will not be shown again
  // */
  void changeOnboardStatus() {
    isOnboardStatus = true;
    notifyListeners();
    _sharedInitAndSave();
  }

  //**
  // the index is updated as the page view scrolls
  // */
  void onPageChanged(int pageNumber) {
    selectedIndex = pageNumber;
    notifyListeners();
  }

  //**
  // if the page indicator points are clicked, the index is updated and the transition is made
  // */
  void dotNavigationClick(int pageNumber) {
    onPageChanged(pageNumber);
    pageController.animateToPage(
      pageNumber,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  //**
  // according to the incoming index value, the transition to that page is made
  // */
  void _animateToPage(int pageNumber) {
    pageController.animateToPage(
      pageNumber,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
