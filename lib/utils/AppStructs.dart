import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/material.dart';

class AppStructs {
  List menustruct = [
    {
      'name': 'Home',
      'route': AppRoutes.home,
      'icon': Icons.home_outlined,
      'active_icon': Icons.home
    },
    {
      'name': 'My Bookmarks',
      'route': AppRoutes.bookmark,
      'icon': Icons.bookmark_outline,
      'active_icon': Icons.bookmark
    },
    {
      'name': 'My Notifications',
      'route': AppRoutes.notification,
      'active_icon': Icons.notifications,
      'icon': Icons.notifications_outlined
    },
    {
      'name': 'My Creations',
      'route': AppRoutes.account,
      'icon': Icons.person_outline,
      'active_icon': Icons.person
    },
  ];
}
