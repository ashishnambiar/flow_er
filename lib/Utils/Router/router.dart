import 'package:flow_er/Presentation/Page/Home/home_page.dart';
import 'package:flow_er/Presentation/Page/Settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/home',
  routes: [
    GoRoute(
      name: Routes.home,
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: Routes.settings,
          path: 'settings',
          builder: (context, state) => const SettingsPage(),
        )
      ],
    ),
  ],
);

class Routes {
  static const home = 'home';
  static const settings = 'settings';
}
