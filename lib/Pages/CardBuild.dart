import 'dart:developer';

import 'package:cardgenrate/Pages/ExportPage.dart';
import 'package:cardgenrate/modals/TextFormModal.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

class CardBuild extends StatelessWidget {
  CardBuild({super.key});
  final controller = Get.put(NameController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Name"),
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height - 100,
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(tempimage.first))),
              ),
              for (int i in List.generate(controller.texts.length, (d) => d))
                Positioned(
                  left: controller.texts[i].left,
                  top: controller.texts[i].top,
                  child: GestureDetector(
                    onTap: () {
                      controller.focus(i);
                    },
                    onPanUpdate: (u) => controller.updateposition(u, i),
                    child: i == controller.cacheindex
                        ? DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            color: controller.texts[i].color,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 10),
                              child: Text(controller.texts[i].text,
                                  style: controller.texts[i].textStyle.copyWith(
                                      fontSize: controller.texts[i].fontSize)),
                            ),
                          )
                        : ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 10),
                            child: Text(controller.texts[i].text,
                                style: controller.texts[i].textStyle.copyWith(
                                    fontSize: controller.texts[i].fontSize)),
                          ),
                  ),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottombuild(),
    );
  }

  Container bottombuild() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.3))
          ]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith(
                (states) => 0.1,
              )),
              child: Icon(Icons.edit),
              onPressed: () {
                Get.dialog(Obx(() => AlertDialog(
                      title: Text("Expand Text "),
                      content: DottedBorder(
                        radius: Radius.circular(20),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: Get.width,
                          height: 100,
                          child: TextFormField(
                            maxLines: 20,
                            initialValue: controller.textFormModal.value.text,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            onChanged: (c) =>
                                controller.updatetext(c, controller.cacheindex),
                          ),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            child: Text("Done"), onPressed: () => Get.back())
                      ],
                    )));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith(
                (states) => 0.1,
              )),
              child: Icon(Icons.open_in_full),
              onPressed: () {
                Get.dialog(Obx(
                  () => AlertDialog(
                    title: Text("Expand Text "),
                    content: Container(
                      height: 40,
                      child: Slider(
                        value: controller.textFormModal.value.fontSize,
                        onChanged: (d) =>
                            controller.updateexpand(d, controller.cacheindex),
                        min: 0,
                        max: 50,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          child: Text("Done"), onPressed: () => Get.back())
                    ],
                  ),
                ));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith(
                (states) => 0.1,
              )),
              child: Icon(Icons.restore),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text("Next"),
              onPressed: () => Get.to(() => ExportPage()),
            )
          ],
        )
      ]),
    );
  }
}

class NameController extends GetxController {
  // FocusNode focusNode = FocusNode();
  var texts = [
    TextFormModal.fromMap({
      'text': 'Hello World!',
      'textStyle': 'Acme',
      'fontSize': 24.0,
      'color': "225,240,149",
      'top': 200.0,
      'left': 200.0,
    }),
    TextFormModal.fromMap({
      'text': 'Hello World!',
      'textStyle': 'Pacifico',
      'fontSize': 24.0,
      'color': "225,240,149",
      'top': 200.0,
      'left': 200.0,
    })
  ].obs;
  int cacheindex = 0;
  Rx<TextFormModal> textFormModal = TextFormModal.fromMap({
    'text': 'Hello World!',
    'textStyle': 'Acme',
    'fontSize': 24.0,
    'color': "225,240,149",
    'top': 200.0,
    'left': 200.0,
  }).obs;

  focus(i) {
    texts[cacheindex] = textFormModal.value;
    textFormModal.value = texts[i];
    cacheindex = i;
  }

  updatetext(value, i) {
    focus(i);
    textFormModal.value.text = value;
    textFormModal.update(textFormModal);
  }

  updateposition(details, i) {
    focus(i);
    textFormModal.value.left += details.delta.dx;
    textFormModal.value.top += details.delta.dy;
    textFormModal.update(textFormModal);
  }

  updateexpand(value, i) {
    focus(i);
    textFormModal.value.fontSize = value;
    textFormModal.update(textFormModal);
  }
}
