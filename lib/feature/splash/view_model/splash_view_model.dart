import 'dart:async';

import 'package:bende_fazla/core/routes/routes.dart';
import 'package:bende_fazla/feature/auth/model/location_model.dart';
import 'package:bende_fazla/feature/auth/repository/auth_repository.dart';
import 'package:bende_fazla/feature/auth/repository/user_info_repository.dart';
import 'package:bende_fazla/feature/splash/view/splash.dart';
import 'package:bende_fazla/product/repository/global_repository.dart';
import 'package:bende_fazla/product/enums/app_shared_keys.dart';
import 'package:bende_fazla/product/local_storage/shared_manager.dart';
import 'package:bende_fazla/product/mixin/index.dart';
import 'package:bende_fazla/product/service/location_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

abstract class SplashViewModel extends State<SplashView> with NavigatorManager implements IGloabalRepository, ILocationService {
  final UserInfoRepository userInfoRepository = UserInfoRepository(
    firestore: FirebaseFirestore.instance,
    firebaseAuth: FirebaseAuth.instance,
  );
  AuthRepository authRepository = AuthRepository(firebaseAuth: FirebaseAuth.instance);
  @override
  void initState() {
    super.initState();
    appInit().then((value) => getOnboard());
  }

  /// variables
  late final SharedManager _sharedManager;
  @override
  bool isLoading = false;

  /// methods
  @override
  Future<void> appInit() async {
    changeLoading();
    _sharedManager = SharedManager();
    await _sharedManager.init();
    setCurrentUserLocation();
    changeLoading();
  }

  @override
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  bool get locationServiceIsEnabled => context.read<LocationService>().locationServiceEnabled;

  @override
  bool get locationPermissionIsDone => context.read<LocationService>().locationPermission;

  @override
  Future<void> setCurrentUserLocation() async {
    if (locationServiceIsEnabled && locationServiceIsEnabled) {
      if (!mounted) return;
      final currentLocation = await Geolocator.getCurrentPosition();

      userInfoRepository.updateLocation(Location(lat: currentLocation.latitude, long: currentLocation.longitude));
    }
  }

  Future<void> getOnboard() async {
    bool isOnboard = _sharedManager.getBool(AppSharedKeys.onboard) ?? false;
    if (isOnboard) {
      final user = await authRepository.checkUserLogin();
      if (user == null) {
        if (!mounted) return;
        navigatePushNamedAndRemoveUntil(context, Routes.welcome);
      } else {
        final user = await userInfoRepository.getCurrentUserInfo();
        if (user?.username != null && user?.username != '') {
          await setCurrentUserLocation();
          if (!mounted) return;
          navigatePushNamedAndRemoveUntil(context, Routes.base);
        } else {
          if (!mounted) return;
          navigatePushNamedAndRemoveUntil(context, Routes.login);
        }
      }
    } else {
      navigatePushNamedAndRemoveUntil(context, Routes.onBoard);
    }
  }
}
