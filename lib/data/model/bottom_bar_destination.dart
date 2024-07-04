import 'package:flutter/material.dart';

class BottomBarDestination {
  final int index;
  final String label;
  final Widget icon;
  final String route;

  BottomBarDestination({
    required this.index,
    required this.label,
    required this.icon,
    required this.route,
  });
}
