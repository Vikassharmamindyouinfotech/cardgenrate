import 'package:bottom_bar_matu/bottom_bar_matu.dart';
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
    return BottomBarBubble(
      selectedIndex: currentIndex,
      color: Colors.pinkAccent,
      items: [
        BottomBarItem(
            iconData: currentIndex == 0 ? Icons.home : Icons.home_outlined),
        BottomBarItem(
            iconData: currentIndex == 1
                ? Icons.bookmark
                : Icons.bookmark_outline_rounded),
        BottomBarItem(
            iconData: currentIndex == 2
                ? Icons.notifications
                : Icons.notifications_outlined),
        BottomBarItem(
            iconData: currentIndex == 3 ? Icons.person : Icons.person_outline),
      ],
      onSelect: (index) {
        Get.offNamed([
          AppRoutes.home,
          AppRoutes.bookmark,
          AppRoutes.notification,
          AppRoutes.account
        ][index]);
      },
    );
  }
}
