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
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ForgotPassword(key: args.key),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ResetPassword(key: args.key),
      );
    },
    CreateAccountRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CreateAccount(
          key: args.key,
          propertyAttachment: args.propertyAttachment,
        ),
      );
    },
    VerifyNumberRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyNumberRouteArgs>(
          orElse: () => const VerifyNumberRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: VerifyNumber(key: args.key),
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
    HomePageRoutee.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
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
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PropertiesPageRoute.name: (routeData) {
      final args = routeData.argsAs<PropertiesPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PropertiesPage(
          key: args.key,
          propertyType: args.propertyType,
          unitType: args.unitType,
        ),
      );
    },
    PropertyDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PropertyDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PropertyDetails(
          key: args.key,
          propertyType: args.propertyType,
          unitType: args.unitType,
        ),
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
          ForgotPasswordRoute.name,
          path: '/forgot-password',
        ),
        RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset-password',
        ),
        RouteConfig(
          CreateAccountRoute.name,
          path: '/create-account',
        ),
        RouteConfig(
          VerifyNumberRoute.name,
          path: '/verify-number',
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
              HomePageRoutee.name,
              path: 'empty-router-page',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  HomePageRoute.name,
                  path: '',
                  parent: HomePageRoutee.name,
                ),
                RouteConfig(
                  PropertiesPageRoute.name,
                  path: 'properties-page',
                  parent: HomePageRoutee.name,
                ),
                RouteConfig(
                  PropertyDetailsRoute.name,
                  path: 'property-details',
                  parent: HomePageRoutee.name,
                ),
              ],
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
/// [ForgotPassword]
class ForgotPasswordRoute extends PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({Key? key})
      : super(
          ForgotPasswordRoute.name,
          path: '/forgot-password',
          args: ForgotPasswordRouteArgs(key: key),
        );

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ResetPassword]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({Key? key})
      : super(
          ResetPasswordRoute.name,
          path: '/reset-password',
          args: ResetPasswordRouteArgs(key: key),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CreateAccount]
class CreateAccountRoute extends PageRouteInfo<CreateAccountRouteArgs> {
  CreateAccountRoute({
    Key? key,
    required PropertyAttachment propertyAttachment,
  }) : super(
          CreateAccountRoute.name,
          path: '/create-account',
          args: CreateAccountRouteArgs(
            key: key,
            propertyAttachment: propertyAttachment,
          ),
        );

  static const String name = 'CreateAccountRoute';
}

class CreateAccountRouteArgs {
  const CreateAccountRouteArgs({
    this.key,
    required this.propertyAttachment,
  });

  final Key? key;

  final PropertyAttachment propertyAttachment;

  @override
  String toString() {
    return 'CreateAccountRouteArgs{key: $key, propertyAttachment: $propertyAttachment}';
  }
}

/// generated route for
/// [VerifyNumber]
class VerifyNumberRoute extends PageRouteInfo<VerifyNumberRouteArgs> {
  VerifyNumberRoute({Key? key})
      : super(
          VerifyNumberRoute.name,
          path: '/verify-number',
          args: VerifyNumberRouteArgs(key: key),
        );

  static const String name = 'VerifyNumberRoute';
}

class VerifyNumberRouteArgs {
  const VerifyNumberRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VerifyNumberRouteArgs{key: $key}';
  }
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
/// [EmptyRouterPage]
class HomePageRoutee extends PageRouteInfo<void> {
  const HomePageRoutee({List<PageRouteInfo>? children})
      : super(
          HomePageRoutee.name,
          path: 'empty-router-page',
          initialChildren: children,
        );

  static const String name = 'HomePageRoutee';
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

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [PropertiesPage]
class PropertiesPageRoute extends PageRouteInfo<PropertiesPageRouteArgs> {
  PropertiesPageRoute({
    Key? key,
    required PropertyType propertyType,
    required UnitType unitType,
  }) : super(
          PropertiesPageRoute.name,
          path: 'properties-page',
          args: PropertiesPageRouteArgs(
            key: key,
            propertyType: propertyType,
            unitType: unitType,
          ),
        );

  static const String name = 'PropertiesPageRoute';
}

class PropertiesPageRouteArgs {
  const PropertiesPageRouteArgs({
    this.key,
    required this.propertyType,
    required this.unitType,
  });

  final Key? key;

  final PropertyType propertyType;

  final UnitType unitType;

  @override
  String toString() {
    return 'PropertiesPageRouteArgs{key: $key, propertyType: $propertyType, unitType: $unitType}';
  }
}

/// generated route for
/// [PropertyDetails]
class PropertyDetailsRoute extends PageRouteInfo<PropertyDetailsRouteArgs> {
  PropertyDetailsRoute({
    Key? key,
    required PropertyType propertyType,
    required UnitType unitType,
  }) : super(
          PropertyDetailsRoute.name,
          path: 'property-details',
          args: PropertyDetailsRouteArgs(
            key: key,
            propertyType: propertyType,
            unitType: unitType,
          ),
        );

  static const String name = 'PropertyDetailsRoute';
}

class PropertyDetailsRouteArgs {
  const PropertyDetailsRouteArgs({
    this.key,
    required this.propertyType,
    required this.unitType,
  });

  final Key? key;

  final PropertyType propertyType;

  final UnitType unitType;

  @override
  String toString() {
    return 'PropertyDetailsRouteArgs{key: $key, propertyType: $propertyType, unitType: $unitType}';
  }
}
