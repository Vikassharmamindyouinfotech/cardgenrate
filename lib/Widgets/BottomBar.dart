import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:cardgenrate/utils/AppStructs.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.currentIndex = 0,
  });
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: BottomBarBubble(
        selectedIndex: currentIndex,
        color: Colors.pinkAccent,
        items: [
          for (var i in AppStructs().menustruct)
            BottomBarItem(
                iconData: currentIndex == AppStructs().menustruct.indexOf(i)
                    ? i['active_icon']
                    : i['icon']),
        ],
        onSelect: (index) {
          Get.offNamed([
            AppRoutes.home,
            AppRoutes.bookmark,
            AppRoutes.notification,
            AppRoutes.account
          ][index]);
        },
      ),
    );
  }
}
