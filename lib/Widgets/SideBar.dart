import 'package:cardgenrate/Widgets/tools.dart';
import 'package:cardgenrate/utils/AppStructs.dart';
import 'package:cardgenrate/utils/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: ListView(
          children: [
            vertical2,
            vertical2,
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
            for (var i in AppStructs().menustruct)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  selectedTileColor: Colors.white,
                  selected: Get.currentRoute == i['route'],
                  onTap: () => Get.offNamed(i['route']),
                  titleAlignment: ListTileTitleAlignment.top,
                  title: Center(
                    child: Text(
                      i['name'],
                      // "${Get.currentRoute}",
                      style: Get.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Get.currentRoute == i['route']
                              ? Colors.pink
                              : null),
                    ),
                  ),
                ),
              )
          ],
        ));
  }
}
