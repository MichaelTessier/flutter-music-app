import 'package:flutter/material.dart';

class NavigationItem {
  String label;
  IconData iconData;
  Widget page;

  Icon get icon => Icon(iconData);
  BottomNavigationBarItem get barItem => BottomNavigationBarItem(
    icon: icon,
    label: label
  );

  NavigationItem({
    required this.label,
    required this.iconData,
    required this.page
  });
}