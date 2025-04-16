import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  final connectivity = Connectivity();
  return connectivity.onConnectivityChanged;
});

final isConnectedProvider = Provider<bool>((ref) {
  final result = ref.watch(connectivityProvider).maybeWhen(
    data: (status) => status,
    orElse: () => ConnectivityResult.none,
  );
  print("inside" +result.toString());
  return result != ConnectivityResult.none;
});
