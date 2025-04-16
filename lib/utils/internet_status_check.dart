import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final internetStatusProvider =
    StateNotifierProvider<ConnectionStatusNotifier, bool>((ref) {
  return ConnectionStatusNotifier();
});

class ConnectionStatusNotifier extends StateNotifier<bool> {
  ConnectionStatusNotifier() : super(true) {
    _init();
  }

  void _init() {
    // Initial check
    InternetConnectionChecker().hasConnection.then((connected) {
      state = connected;
    });

    // Listen to real-time changes
    InternetConnectionChecker().onStatusChange.listen((status) {
      state = status == InternetConnectionStatus.connected;
    });
  }
}
