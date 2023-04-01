import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/chat/chat_view.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/features/home/view/home_view.dart';
import 'package:pms_manager/features/intro/view/create_account.dart';
import 'package:pms_manager/features/intro/view/login_page.dart';
import 'package:pms_manager/features/intro/view/page_view.dart';
import 'package:pms_manager/features/intro/view/register_account.dart';
import 'package:pms_manager/features/notification/notification.dart';
import 'package:pms_manager/features/phone_auth/view/forgot_password.dart';
import 'package:pms_manager/features/phone_auth/view/reset_password.dart';
import 'package:pms_manager/features/phone_auth/view/verify_number.dart';
import 'package:pms_manager/features/search/search_view.dart';
import 'package:pms_manager/features/setting/view/setting_view.dart';
import 'package:pms_manager/main.dart';
part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true, name: 'MyHomeRoute'),
    AutoRoute(page: PageViewIntro, name: 'PageViewRoute'),
    AutoRoute(page: LoginPage, name: 'LogInRoute'),
    AutoRoute(page: RegisterAccount, name: 'RegisterAccountRoute'),
    AutoRoute(page: ForgotPassword, name: 'ForgotPasswordRoute',),
    AutoRoute(page: ResetPassword, name: 'ResetPasswordRoute'),
    AutoRoute(page: CreateAccount, name: 'CreateAccountRoute'),
    AutoRoute(page: VerifyNumber, name: 'VerifyNumberRoute'),
    AutoRoute(page: HomeView, name: 'HomeRoute', children: [
      AutoRoute(
        page: ChatView,
        name: 'ChatViewRoute',
      ),
      AutoRoute(
        page: NotificationView,
        name: 'NotificationViewRoute',
      ),
      AutoRoute(
        page: HomePage,
        name: 'HomePageRoute',
      ),
      AutoRoute(
        page: SearchView,
        name: 'SearchViewRoute',
      ),
      AutoRoute(
        page: SettingView,
        name: 'SettingViewRoute',
      ),
    ]),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
