import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class ILocationService {
  bool get locationServiceIsEnabled;
  bool get locationPermissionIsDone;
  void setCurrentUserLocation();
}

class LocationService extends ChangeNotifier {
  bool _locationServiceEnabled = false;
  bool _locationPermission = false;
  Position? _currentPosition;

  bool get locationServiceEnabled => _locationServiceEnabled;
  bool get locationPermission => _locationPermission;
  Position? get currentPosition => _currentPosition;

  Future<void> checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool serviceRequested = await Geolocator.openLocationSettings();
      if (!serviceRequested) {
        _locationServiceEnabled = false;
        notifyListeners();
        return;
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _locationPermission = false;
        notifyListeners();
        return;
      }
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    _locationServiceEnabled = true;
    _locationPermission = true;
    notifyListeners();
  }
}
