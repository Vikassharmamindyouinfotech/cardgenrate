import 'package:cardgenrate/utils/routes.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.grey)],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60)),
          ),
          child: Image.network(
            "https://img.lovepik.com/background/20211029/medium/lovepik-color-creative-marriage-and-marriage-background-image_605659350.jpg",
            height: Get.height * 0.6,
            fit: BoxFit.cover,
            width: Get.width,
          ),
        ),
        vertical2,
        vertical2,
        Center(
          child: Text(
            "Generate Invitation",
            style:
                Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        vertical,
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eligendi odio earum ab velit laudantium dolores! Veritatis autem tempore ducimus sequi.",
              style: Get.textTheme.bodyMedium!.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        vertical2,
        FloatingActionButton.extended(
          elevation: 0.5,
          label: Text(
            "  Get Started  ",
          ),
          extendedTextStyle: Get.textTheme.titleMedium,
          onPressed: () => Get.offNamed(AppRoutes.home),
        )
      ]),
    );
  }
}
