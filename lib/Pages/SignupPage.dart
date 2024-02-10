import 'package:cardgenrate/Widgets/tools.dart';
import 'package:cardgenrate/utils/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              verticalhalf,
              // Center(
              //   child: Text(
              //     "SIGN UP!",
              //     style: Get.textTheme.headlineSmall!.copyWith(
              //         fontWeight: FontWeight.w500, color: Colors.grey.shade400),
              //   ),
              // ),
              vertical,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Name"),
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
                      "SIGN UP",
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.login),
                ),
              ),
              vertical2,
              vertical2,
              Center(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Already have Account? "),
                  InkWell(
                      onTap: () => Get.back(),
                      child: Text(
                        "LOG IN",
                        style: Get.textTheme.titleMedium!.copyWith(
                          color: Get.theme.primaryColor,
                          // decorationColor: Get.theme.primaryColor,
                          // decoration: TextDecoration.underline
                        ),
                      )),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
