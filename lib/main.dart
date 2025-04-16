import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_demo/app_router_config.dart';
import 'package:go_router_demo/widgets/connection_check.dart';
import 'package:logger/logger.dart';

void main() {
  Logger.level = Level.error;
  runApp(const ProviderScope(child: ConnectionCheck()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyAppRouter().router, // Set GoRouter
      debugShowCheckedModeBanner: false,
    );
  }
}
