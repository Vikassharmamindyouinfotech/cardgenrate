import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Profile'),
              pinned: true,
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
                      style:
                          Get.textTheme.bodyLarge!.copyWith(color: Colors.grey),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                      "https://content.wepik.com/statics/133368120/preview-page0.jpg"),
                ),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: 3,
        ));
  }
}
