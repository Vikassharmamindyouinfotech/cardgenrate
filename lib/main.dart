// import 'dart:ffi';

import 'dart:developer';
import 'package:cardgenrate/Pages/HomePage.dart';
import 'package:cardgenrate/Pages/Starter.dart';
import 'package:cardgenrate/SplashScreen.dart';
import 'package:cardgenrate/firebase_options.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Firebase.apps.first.;
  runApp(const MyApp());
}

gettoken() async {
  try {
    // Firebase.app().
    // FirebaseMessaging.instance

    await FirebaseMessaging.instance.requestPermission();
    String? token = await FirebaseMessaging.instance.getToken(
        vapidKey:
            "BNeBV2bfdsOgRwQUDnpb3PBt-4Q1u8_VJpDOWzd-KmVhkYjGtwp3uImpPSUkmAVAC60-f4DgUheaRoEPLV2s1uI");
    log(token!);
    // final a = await FirebaseMessaging.instance.getToken();
    // log(a!);
  } catch (e) {
    log(e.toString() + "xdcf");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log("gett");
    gettoken();
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
        // home: SplashScreen(),
        initialRoute: "/splash",
        getPages: [
          GetPage(name: "/splash", page: () => SplashScreen()),
          for (var i in AppRoutes().router.entries)
            GetPage(name: i.key, page: () => i.value)
        ]);
  }
}
