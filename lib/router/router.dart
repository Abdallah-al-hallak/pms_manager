import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/home/view/home_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    /// routes go here
    AutoRoute(path: '/', page: HomeRoute.page)
  ];
}

class $AppRouter {}
