import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:national_identic/main_page.dart';
import 'package:national_identic/settings_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<SettingsRoute>(path: 'settings'),
  ],
)
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const MainPage();
  }
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    return const SettingsPage();
  }
}
