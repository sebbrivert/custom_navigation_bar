import 'package:custom_bottom_bar/models/navigation_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<NavigationItem> children;
  final int currentIndex;
  final void Function(int newIndex) onTap;
  final Color selectedItemBackgroundColor;
  final Color unselectedItemBackgroundColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final bool displayLabel;
  final bool displayIcon;

  const CustomNavigationBar({
    required this.currentIndex,
    required this.children,
    required this.onTap,
    required this.selectedItemBackgroundColor,
    required this.selectedIconColor,
    required this.selectedLabelColor,
    required this.unselectedItemBackgroundColor,
    required this.unselectedIconColor,
    required this.unselectedLabelColor,
    this.displayLabel = true,
    this.displayIcon = true,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: children.elementAt(currentIndex).backgroundColor ?? unselectedItemBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 25,
            offset: Offset(8, 10)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children.map((item) => _buildNavItem(item)).toList(),
      )
    );
  }

  Widget _buildNavItem(NavigationItem item) {
    return Expanded(
      child: Material(
        color: currentIndex == item.index ? children.elementAt(currentIndex).backgroundColor ?? selectedItemBackgroundColor : Colors.transparent,
        borderRadius: _computeBorderRadius(item),
        child: InkWell(
          onTap: (){onTap(item.index);},
          borderRadius: _computeBorderRadius(item),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(displayIcon)
                  Icon(
                    item.icon,
                    color: currentIndex == item.index ? selectedIconColor : unselectedIconColor,
                    size: 30,
                  ),
                const SizedBox(height: 4),
                if(displayLabel)
                  Text(
                    item.label,
                    style: TextStyle(
                        color: currentIndex == item.index ? selectedLabelColor : unselectedLabelColor,
                        fontSize: 12
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
  BorderRadius _computeBorderRadius(NavigationItem item) {
    var index = children.indexOf(item);
    if(index == 0){
      return BorderRadius.only(topLeft: Radius.circular(25), bottomLeft: Radius.circular(25));
    }
    if(index == children.length-1){
      return BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25));
    }

    return BorderRadius.zero;
  }
}
