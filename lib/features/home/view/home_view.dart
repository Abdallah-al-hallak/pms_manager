import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/features/home/view/home_page.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> globalKey = GlobalKey();
    final iconList = <IconData>[
      Icons.chat,
      Icons.notifications,
      Icons.home_filled,
      Icons.search,
      Icons.settings,
    ];

    return AutoTabsScaffold(
      homeIndex: 2,
      backgroundColor: Colors.white,
      scaffoldKey: globalKey,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 2.1,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
          ),
        ),
        child: Center(child: const Text('Drawer Stuff')),
      ),
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          leadingWidth: 100,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
                onPressed: () {
                  globalKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  size: 35,
                  color: gold,
                )),
          ),
        );
      },
      routes: const [
        ChatViewRoute(),
        SettingViewRoute(),
        HomePageRoute(),
        NotificationViewRoute(),
        SearchViewRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return AnimatedBottomNavigationBar(
          height: 100,
          backgroundColor: lightDark,
          gapWidth: 1,

          inactiveColor: Colors.white,

          activeColor: Colors.red,
          icons: iconList,
          activeIndex: tabsRouter.activeIndex,
          leftCornerRadius: 32,
          rightCornerRadius: 30,
          gapLocation: GapLocation.none,
          onTap: tabsRouter.setActiveIndex,
          //other params

          // items: const [
          //   BottomNavigationBarItem(

          //       activeIcon: Icon(
          //         Icons.home_outlined,
          //       ),
          //       icon: Icon(
          //         Icons.home,
          //       ),
          //       label: 'Home',
          //       backgroundColor: Colors.white),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.article),
          //     label: 'Schedule',
          //   ),
          // ],
        );
      },
    );
  }
}
