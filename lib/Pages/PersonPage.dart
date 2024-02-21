import 'dart:developer';

import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:cardgenrate/Widgets/SideBar.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    log(Get.parameters.toString());
    return Row(
      children: [
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
              ),
              body: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        pinned: true,
                        automaticallyImplyLeading: false,
                        // floating: true,
                        expandedHeight: 300.0,
                        flexibleSpace: FlexibleSpaceBar(
                            background: SafeArea(
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              vertical2,
                              vertical2,
                              vertical2,
                              CircleAvatar(
                                  radius: 50,
                                  foregroundImage: NetworkImage(
                                      "https://image.winudf.com/v2/image1/bmV0LndsbHBwci5ib3lzX3Byb2ZpbGVfcGljdHVyZXNfc2NyZWVuXzZfMTY2NzUzNzYyMV8wMzQ/screen-6.webp?fakeurl=1&type=.webp")),
                              verticalhalf,
                              Text(
                                "Name Surname",
                                style: Get.textTheme.titleMedium,
                              ),
                              Text(
                                "8 Cards Creations",
                                style: Get.textTheme.bodyLarge!
                                    .copyWith(color: Colors.grey),
                              ),
                              ElevatedButton(
                                child: Text("Settings"),
                                onPressed: () => (),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  horizontal,
                                  Text(
                                    "My Creations",
                                    style: Get.textTheme.titleMedium,
                                  )
                                ],
                              ),
                              verticalhalf,
                            ],
                          ),
                        )),
                      ),
                      // Divider(),
                      SliverGrid.builder(
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300),
                        itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                "https://content.wepik.com/statics/133368120/preview-page0.jpg"),
                          ),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Get.width <= 1000
                  ? BottomBar(
                      currentIndex: 3,
                    )
                  : null),
        ),
        if (kIsWeb && Get.width > 1000)
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400), child: SideBar())
      ],
    );
  }
}
