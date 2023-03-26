import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/home/view/home_page.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
