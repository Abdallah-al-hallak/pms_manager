import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
  void initState() {
    super.initState();
  }

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
    int _selectedIndex = 2;
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          centerTitle: true,
          title: tabsRouter.currentPath != '/home-view/empty-router-page'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.filter_alt,
                      color: gold,
                    ),
                    SizedBox(width: 10.0, height: 0.0),
                    SearchFieldScreens()
                  ],
                )
              : null,
          iconTheme: const IconThemeData(color: gold),
          // leadingWidth: 100,
          backgroundColor: Colors.white,
          elevation: 0,
        );
      },
      backgroundColor: Colors.white,
      scaffoldKey: globalKey,
      drawer: Drawer(
        width: 200,
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
                style: TextStyle(fontSize: 16, fontFamily: 'Helvetica'),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'SubManagers',
                style: TextStyle(fontSize: 16, fontFamily: 'Helvetica'),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              ExpandablePanel(
                  theme: const ExpandableThemeData(
                      alignment: Alignment.topRight,
                      iconPlacement: ExpandablePanelIconPlacement.right,
                      iconColor: gold,
                      headerAlignment: ExpandablePanelHeaderAlignment.bottom,
                      animationDuration: const Duration(milliseconds: 500)),
                  builder: (context, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    );
                  },
                  header: const SizedBox(
                    height: 30,
                    child: Text(
                      'Properties',
                      style: TextStyle(
                          fontSize: 16, color: gold, fontFamily: 'Helvetica'),
                    ),
                  ),
                  collapsed: const Text(
                    'zdh',
                    style: TextStyle(
                      fontSize: 0,
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Units',
                        style: TextStyle(fontFamily: 'Helvetica'),
                      ),
                      SizedBox(width: 0.0, height: 5.0),
                      Text(
                        'Cpmpounds',
                        style: TextStyle(fontFamily: 'Helvetica'),
                      ),
                      SizedBox(width: 0.0, height: 5.0),
                      Text(
                        'Buildings',
                        style: TextStyle(fontFamily: 'Helvetica'),
                      ),
                    ],
                  )),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'owners',
                style: TextStyle(fontSize: 16, fontFamily: 'Helvetica'),
              ),
              const Divider(),
              const SizedBox(
                width: 0.0,
                height: 20.0,
              ),
              const Text(
                'Tenants',
                style: TextStyle(fontSize: 16, fontFamily: 'Helvetica'),
              ),
            ],
          ),
        )),
      ),
      routes: const [
        ChatViewRoute(),
        SettingViewRoute(),
        HomePageRoutee(),
        NotificationViewRoute(),
        SearchViewRoute(),
      ],
      homeIndex: 2,
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

class SearchFieldScreens extends ConsumerWidget {
  const SearchFieldScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    // var size = MediaQuery.of(context).size;
    return Container(
      // alignment: Alignment.center,
      height: 32,
      width: 270,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          BoxDecoration(color: gold, borderRadius: BorderRadius.circular(14)),
      child: const TextField(
        decoration: InputDecoration(
            hintText: '  search ...',
            suffixIcon: Icon(Icons.search,
            color: Colors.white,
              size: 17,
            ),
            hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            border: InputBorder.none),
      ),
    );
  }
}
