import 'package:dashboard/helpers/responsiveness.dart';
import 'package:dashboard/widgets/horizontal_menu_item.dart';
import 'package:dashboard/widgets/vertical_menu_item.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const SideMenuItem({required this.itemName, required this.onTap});
  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.inCustomScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: onTap);
    } else {
      return HorizontalMenuItem(itemName: itemName, onTap: onTap);
    }
  }
}
