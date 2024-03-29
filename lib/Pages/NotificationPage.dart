import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:cardgenrate/Widgets/SideBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
              appBar: AppBar(title: Text("Notification")),
              body: ListView.builder(
                  itemCount: 20,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (c, i) => Card(
                        child: ListTile(
                            leading: Transform.rotate(
                                angle: 0.2,
                                child:
                                    Icon(Icons.notifications_active_outlined)),
                            title: Text(
                              "New Update in App",
                              style: Get.textTheme.titleSmall,
                            ),
                            subtitle: Text(
                                "New Update in App find new Ai Generated cards")),
                      )),
              bottomNavigationBar: Get.width <= 1000
                  ? BottomBar(
                      currentIndex: 2,
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
