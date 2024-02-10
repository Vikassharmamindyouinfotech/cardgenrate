import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cardgenrate/utils/path.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2), () => Get.offNamed(AppRoutes.login));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Card(
            shadowColor: Colors.pink.withOpacity(0.1),
            elevation: 10,
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 60,
              foregroundImage: AssetImage(AssetPaths().logopath),
            ),
          ),
        ),
        AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText("Wed-arranger",
                textStyle: Get.textTheme.headlineSmall!.merge(
                  GoogleFonts.pacifico(color: Colors.pink),
                ),
                speed: Duration(milliseconds: 100))
          ],
        )
      ]),
    );
  }
}
