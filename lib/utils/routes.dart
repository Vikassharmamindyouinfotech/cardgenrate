import 'package:cardgenrate/Pages/BookMarkPage.dart';
import 'package:cardgenrate/Pages/HomePage.dart';
import 'package:cardgenrate/Pages/LoginPage.dart';
import 'package:cardgenrate/Pages/NotificationPage.dart';
import 'package:cardgenrate/Pages/PersonPage.dart';
import 'package:cardgenrate/Pages/SignupPage.dart';
import 'package:cardgenrate/Pages/Starter.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static String login = "/login";

  static String signup = "/signup";
  static String start = "/starter";
  static String home = "/homePage";
  static String bookmark = "/bookmark";
  static String notification = "/notification";
  static String account = "/account";

  Map<String, Widget> get router => {
        AppRoutes.signup: SignupPage(),
        AppRoutes.login: LoginPage(),
        AppRoutes.start: StarterScreen(),
        AppRoutes.home: HomePage(),
        AppRoutes.bookmark: BookMarkPage(),
        AppRoutes.notification: NotificationPage(),
        AppRoutes.account: AccountPage()
      };
}
