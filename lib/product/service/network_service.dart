import 'dart:async';
import 'package:bende_fazla/product/helpers/helper_functions/helper_functions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkService {
  final BuildContext context;
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionController = StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  NetworkService(this.context) {
    _initialize();
  }

  void _initialize() {
    _connectivity.onConnectivityChanged.listen((result) {
      bool isConnected = result != ConnectivityResult.none;
      if (isConnected) {
        _connectionController.add(isConnected);
      } else {
        HelperFunctions.showSnackBar(context, 'No Internet Connection');
      }
    });
  }

  void dispose() {
    _connectionController.close();
  }
}

class NetworkProvider extends ChangeNotifier {
  final BuildContext context;
  late final NetworkService _connectivityService;
  late StreamSubscription<bool> _subscription;

  bool _isConnected = true;

  bool get isConnected => _isConnected;

  NetworkProvider(this.context) {
    _connectivityService = NetworkService(context);
    _subscription = _connectivityService.connectionStream.listen((isConnected) {
      if (_isConnected != isConnected) {
        _isConnected = isConnected;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
