import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkConnectionCheck extends ChangeNotifier {
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  late final StreamSubscription _subscription;

  NetworkConnectionCheck() {
    _subscription = Connectivity().onConnectivityChanged.listen((status) async {
      final hasConnection = await _checkInternet();
      _isConnected = hasConnection;
      notifyListeners();
    });

    // Initial check
    Connectivity().checkConnectivity().then((status) async {
      _isConnected = await _checkInternet();
      notifyListeners();
    });
  }

  Future<bool> _checkInternet() async {
    try {
      final result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
