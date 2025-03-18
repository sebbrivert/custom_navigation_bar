import 'package:flutter/cupertino.dart';

class NavigationItem {
  /// The icon for the navigation button item
  IconData icon;
  /// The text label for this NavigationItem
  String label;
  /// The
  int index;
  Color? backgroundColor;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.index,
    this.backgroundColor,
  });
}