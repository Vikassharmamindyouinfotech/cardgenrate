import 'package:cardgenrate/Widgets/GreaanyTexture.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:cardgenrate/utils/path.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size(Get.width, Get.height),
        painter: GrainyPainter(),
        child: Center(
          child: Container(
            color: Colors.white.withOpacity(0.4),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
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
                  Center(
                    child: Text("Wed-arranger",
                        style: Get.textTheme.headlineSmall!
                            .merge(GoogleFonts.pacifico(color: Colors.pink))),
                  ),
                  vertical2,
                  vertical2,
                  // Center(
                  //     child: Text("Welcome Back",
                  //         style: Get.textTheme.titleLarge!
                  //             .merge(GoogleFonts.ledger(color: Colors.grey)))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Email"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  vertical,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Password"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  vertical2,
                  vertical2,
                  Center(
                    child: ElevatedButton.icon(
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15),
                        child: Text(
                          "LOG IN",
                        ),
                      ),
                      onPressed: () => Get.offNamed(AppRoutes.start),
                      icon: Icon(Icons.login),
                    ),
                  ),
                  vertical2,
                  vertical2,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      horizontal,
                      Text(
                        "OR",
                        style: Get.textTheme.titleSmall!
                            .copyWith(color: Get.theme.primaryColor),
                      ),
                      horizontal,
                      Expanded(
                        child: Divider(),
                      )
                    ],
                  ),
                  vertical2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.google),
                        ),
                      ),
                      Card(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.facebookF),
                        ),
                      ),
                      Card(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.xTwitter),
                        ),
                      ),
                    ],
                  ),
                  vertical2,
                  vertical2,
                  Center(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Don't have account? "),
                      InkWell(
                          onTap: () => Get.toNamed(AppRoutes.signup),
                          child: Text(
                            "SIGN UP",
                            style: Get.textTheme.titleMedium!.copyWith(
                              color: Get.theme.primaryColor,
                              // decorationColor: Get.theme.primaryColor,
                              // decoration: TextDecoration.underline
                            ),
                          )),
                    ],
                  )),
                  vertical2
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
