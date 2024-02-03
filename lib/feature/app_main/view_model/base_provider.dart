import 'package:bende_fazla/feature/app_main/repository/datas/bottom_nav_items.dart';
import 'package:bende_fazla/feature/app_main/view/home.dart';
import 'package:bende_fazla/feature/app_main/view/message_view.dart';
import 'package:bende_fazla/feature/app_main/view/product/product_view.dart';
import 'package:bende_fazla/feature/app_main/view/profile/profile.dart';
import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/product/helpers/custom_alert_dialog.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier with NavigatorManager {
  BaseProvider(this.context) {
    _init();
  }
  final BuildContext context;
  final AuthRepository _authRepository = AuthRepository(
    firebaseAuth: FirebaseAuth.instance,
  );
  final List<NavigationDestination> items = BottomBarViews().views;

  int get selectedIndex => _selectedIndex;
  Position? currentPosition;
  bool serviceEnabled = true;
  bool permissionDone = true;
  int _selectedIndex = 0;

  void onDestinationSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void changePermission() {
    permissionDone = !permissionDone;
    notifyListeners();
  }

  Widget body(BuildContext context) {
    // if (currentPosition != null) {
    switch (_selectedIndex) {
      case 0:
        return HomeView();
      case 1:
        return const ProductView();
      case 3:
        return const MessageView();
      case 4:
        return const ProfileView();
      default:
        return const Center(child: Text('Home'));
    }
  }

  void signOut({
    required BuildContext context,
    required bool mounted,
  }) {
    _authRepository.signOut(
      context: context,
      mounted: mounted,
    );
  }

  Future<void> _init() async {
    await getCurrentLocation(context: context);
  }

  Future<void> getCurrentLocation({required BuildContext context}) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // ignore: use_build_context_synchronously
        customAlertDialog(context: context, message: 'Konum izni reddedildi. Lütfen ayarlarınızı kontrol edin.');

        return;
      }
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      customAlertDialog(context: context, message: 'Konum servisiniz kapalı. Lütfen ayarlarınızı kontrol edin.');
      return;
    }
    currentPosition = await Geolocator.getCurrentPosition();
  }
}
