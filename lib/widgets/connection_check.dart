import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_demo/main.dart';
import '../providers/network_providers.dart';
import '../screens/connectivity_error_screen.dart';
import '../utils/internet_status_check.dart';

class ConnectionCheck extends ConsumerWidget {
  const ConnectionCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionStatus = ref.watch(isConnectedProvider);
    final internetStatus = ref.watch(internetStatusProvider);

    if (!internetStatus) {
      return const MaterialApp(
        home: NoInternetScreen(),
      );
    } else {
      return const MyApp();
    }
  }
}
