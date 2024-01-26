import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/IconConstant.dart';
import '../constants/colors.dart';

class BottomNavBar extends StatelessWidget {

  final StatefulNavigationShell navigationShell;
  BottomNavBar(this.navigationShell, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: navigationShell, bottomNavigationBar: _bottomNavigationBarWidget());

  _bottomNavigationBarWidget() => NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      height: 65,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: _onDestinationSelected,
      destinations: destinationsList);

  _onDestinationSelected(index) async {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  final List<NavigationDestination> destinationsList = [
    const NavigationDestination(
        icon: Icon(IconConstant.homeBottomMenuIcon, size: 18),
        selectedIcon: Icon(IconConstant.homeBottomMenuSelectIcon,
            color: iconWhiteColor, size: 18),
        label: 'Home'),
    const NavigationDestination(
        icon: Icon(IconConstant.returnBottomMenuIcon, size: 18),
        selectedIcon: Icon(IconConstant.returnBottomMenuSelectIcon,
            color: iconWhiteColor, size: 18),
        label: 'Return'),
    const NavigationDestination(
        icon: Icon(IconConstant.profileBottomMenuIcon, size: 18),
        selectedIcon: Icon(IconConstant.profileBottomMenuSelectIcon,
            color: iconWhiteColor, size: 18),
        label: 'Setting')
  ];
}