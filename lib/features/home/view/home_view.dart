import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pms_manager/router/router.dart';
import 'package:pms_manager/utils/colors.dart';
import 'package:pms_manager/utils/styles.dart';

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
    final textList = <String>[
      'chat',
      'notification',
      'Home',
      'search',
      'settings',
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
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  globalKey.currentState?.closeDrawer();
                },
                icon: const Icon(Icons.close),
                color: gold,
              ),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              Text(
                'Menu',
                style: titleTextStyle(),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'Profile',
                style: TextStyle(fontSize: 15),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'SubManagers',
                style: TextStyle(fontSize: 15),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'Properties',
                style: TextStyle(fontSize: 15),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'owners',
                style: TextStyle(fontSize: 15),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'Tenants',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        )),
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
        return AnimatedBottomNavigationBar.builder(
          itemCount: 5,
          tabBuilder: (index, isActive) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  color: gold,
                  size: isActive ? 40 : 30,
                ),
                if (isActive)
                  Text(
                    textList[index],
                    style: const TextStyle(
                        color: gold, fontWeight: FontWeight.bold, fontSize: 16),
                  )
              ],
            );
          },
          height: 85,
          backgroundColor: lightDark,
          gapWidth: 1,

          // inactiveColor: Colors.white,

          // activeColor: Colors.red,
          // icons: iconList,
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
