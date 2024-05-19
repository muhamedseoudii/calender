import 'package:calender/screens/add_screen/add_view.dart';
import 'package:calender/screens/home_screen/home_view.dart';
import 'package:calender/screens/notification_screen/notification_view.dart';
import 'package:calender/screens/profile_screen/profile_view.dart';
import 'package:calender/screens/search_screen/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        const HomeView(),
        const SearchView(),
        const AddView(),
        const NotificationView(),
        const ProfileView(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.house_alt_fill),
          inactiveIcon: const Icon(CupertinoIcons.house_alt),
          title: ("home".tr),
          activeColorPrimary: const Color(0xff1565C0),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.search),
          title: ("search".tr),
          activeColorPrimary: const Color(0xff1565C0),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            CupertinoIcons.add,
            // color: CupertinoColors.white,
          ),
          title: ("add".tr),
          activeColorPrimary: const Color(0xff1565C0),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.bell_fill),
          inactiveIcon: const Icon(CupertinoIcons.bell),
          title: ("notification".tr),
          activeColorPrimary: const Color(0xff1565C0),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_fill),
          inactiveIcon: const Icon(CupertinoIcons.person),
          title: ("profile".tr),
          activeColorPrimary: const Color(0xff1565C0),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        controller: controller,
        screens: buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black // Color for dark mode
            : Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(12.0),
          colorBehindNavBar: Theme.of(context).brightness == Brightness.dark
              ? Colors.black // Color for dark mode
              : Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
