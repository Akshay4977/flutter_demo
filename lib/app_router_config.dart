import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/app_router_constant.dart';
import 'package:go_router_demo/screens/about.dart';
import 'package:go_router_demo/screens/details_with_graph.dart';
import 'package:go_router_demo/screens/home.dart';

class MyAppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
        path: '/',
        name: AppRouterConstant.home,
        pageBuilder: (context, state) {
          return const MaterialPage(child: Home());
        }),
    GoRoute(
        path: '/details/:username',
        name: AppRouterConstant.details,
        pageBuilder: (context, state) {
          return MaterialPage(child: Details(username: state.pathParameters['username']!,));
        }),
    GoRoute(
        path: '/about',
        name: AppRouterConstant.about,
        pageBuilder: (context, state) {
          return const MaterialPage(child: About());
        }),
  ]);
}
