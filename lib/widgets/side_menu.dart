import 'package:dashboard/constants/controllers.dart';
import 'package:dashboard/constants/style.dart';
import 'package:dashboard/helpers/responsiveness.dart';
import 'package:dashboard/routing/routes.dart';
import 'package:dashboard/widgets/custom_text.dart';
import 'package:dashboard/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.inSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "icon/icon.png",
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Flexible(
                        child: CustomText(
                      text: "Dash",
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    )),
                    SizedBox(
                      width: _width / 48,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute
                        ? "Log Out"
                        : itemName,
                    onTap: () {
                      if (itemName == AuthenticationPageRoute) {
                        // Todo:: go to authentication page

                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveItemTo(itemName);
                        if (ResponsiveWidget.inSmallScreen(context)) {
                          Get.back();

                          // TODO:: go to item name Route
                        }
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
