import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CardCategoryPage extends StatelessWidget {
  const CardCategoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("${Get.parameters['name']}"),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1400),
          margin: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: StaggeredGrid.extent(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                maxCrossAxisExtent: Get.width > 700 ? 400 : 220,
                children: [
                  for (int i in List.generate(39, (index) => index + 1))
                    Card(
                      color: Colors.white,
                      child: Container(
                          height: Get.width > 700
                              ? (i.isOdd ? 200 : 100) * 2
                              : i.isOdd
                                  ? 200
                                  : 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3)),
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1156&q=80",
                                  height: Get.width > 700
                                      ? ((i.isOdd ? 200 : 100) * 2) - 100
                                      : i.isOdd
                                          ? 200
                                          : 100,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "Wedding Card",
                                style: Get.textTheme.titleMedium,
                              ),
                              Text(
                                "describe card",
                                style: Get.textTheme.bodyMedium,
                              )
                            ],
                          )),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
