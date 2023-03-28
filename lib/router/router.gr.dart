// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MyHomePage(),
      );
    },
    PageViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PageViewIntro(),
      );
    },
    LogInRoute.name: (routeData) {
      final args = routeData.argsAs<LogInRouteArgs>(
          orElse: () => const LogInRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    RegisterAccountRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterAccount(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    ChatViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ChatView(),
      );
    },
    NotificationViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationView(),
      );
    },
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SearchViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    SettingViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MyHomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          PageViewRoute.name,
          path: '/page-view-intro',
        ),
        RouteConfig(
          LogInRoute.name,
          path: '/login-page',
        ),
        RouteConfig(
          RegisterAccountRoute.name,
          path: '/register-account',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home-view',
          children: [
            RouteConfig(
              ChatViewRoute.name,
              path: 'chat-view',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              NotificationViewRoute.name,
              path: 'notification-view',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              HomePageRoute.name,
              path: 'home-page',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              SearchViewRoute.name,
              path: 'search-view',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              SettingViewRoute.name,
              path: 'setting-view',
              parent: HomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute()
      : super(
          MyHomeRoute.name,
          path: '/',
        );

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [PageViewIntro]
class PageViewRoute extends PageRouteInfo<void> {
  const PageViewRoute()
      : super(
          PageViewRoute.name,
          path: '/page-view-intro',
        );

  static const String name = 'PageViewRoute';
}

/// generated route for
/// [LoginPage]
class LogInRoute extends PageRouteInfo<LogInRouteArgs> {
  LogInRoute({Key? key})
      : super(
          LogInRoute.name,
          path: '/login-page',
          args: LogInRouteArgs(key: key),
        );

  static const String name = 'LogInRoute';
}

class LogInRouteArgs {
  const LogInRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LogInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterAccount]
class RegisterAccountRoute extends PageRouteInfo<void> {
  const RegisterAccountRoute()
      : super(
          RegisterAccountRoute.name,
          path: '/register-account',
        );

  static const String name = 'RegisterAccountRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/home-view',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ChatView]
class ChatViewRoute extends PageRouteInfo<void> {
  const ChatViewRoute()
      : super(
          ChatViewRoute.name,
          path: 'chat-view',
        );

  static const String name = 'ChatViewRoute';
}

/// generated route for
/// [NotificationView]
class NotificationViewRoute extends PageRouteInfo<void> {
  const NotificationViewRoute()
      : super(
          NotificationViewRoute.name,
          path: 'notification-view',
        );

  static const String name = 'NotificationViewRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: 'home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [SearchView]
class SearchViewRoute extends PageRouteInfo<void> {
  const SearchViewRoute()
      : super(
          SearchViewRoute.name,
          path: 'search-view',
        );

  static const String name = 'SearchViewRoute';
}

/// generated route for
/// [SettingView]
class SettingViewRoute extends PageRouteInfo<void> {
  const SettingViewRoute()
      : super(
          SettingViewRoute.name,
          path: 'setting-view',
        );

  static const String name = 'SettingViewRoute';
}
