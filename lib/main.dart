// import 'dart:ffi';

import 'package:cardgenrate/Pages/HomePage.dart';
import 'package:cardgenrate/Pages/Starter.dart';
import 'package:cardgenrate/SplashScreen.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.rightToLeftWithFade,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en", "US"),
          Locale('fr', "CH"),
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink, primary: Colors.purple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        // initialRoute: AppRoutes.login,
        getPages: [
          for (var i in AppRoutes().router.entries)
            GetPage(name: i.key, page: () => i.value)
        ]);
  }
}
