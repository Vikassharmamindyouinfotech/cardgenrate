import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:cardgenrate/Pages/CardCategoryDetailsPage.dart';
import 'package:cardgenrate/Widgets/SideBar.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ScrollController _horizontal = ScrollController();
  final ScrollController _vertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                title: Text("Wed-Arranger",
                    style: GoogleFonts.pacifico(color: Colors.pink)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  controller: _vertical,
                  child: SingleChildScrollView(
                    controller: _vertical,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  label: Text("Search Cards"),
                                  isDense: true,
                                  hintText: "Enter Text to Search",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.1),
                                      borderRadius: BorderRadius.circular(10))),
                            )),
                        vertical,
                        Row(
                          children: [
                            horizontal2,
                            Text(
                              "Popular Cards",
                              style: Get.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        vertical,
                        SizedBox(
                          height: 280,
                          child: Scrollbar(
                            controller: _horizontal,
                            // isAlwaysShown: true,
                            child: ListView.builder(
                                controller: _horizontal,
                                scrollDirection: Axis.horizontal,
                                itemCount: 8,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                itemBuilder: (c, i) => Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 300,
                                      child: Column(
                                        children: [
                                          Stack(
                                            clipBehavior: Clip.none,
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Container(
                                                width: 300,
                                                height: 200,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 5,
                                                          color: Colors.pink
                                                              .withOpacity(0.1))
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .elliptical(
                                                                    30, 50),
                                                            bottomLeft: Radius
                                                                .elliptical(
                                                                    30, 50),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20))),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    ColorFiltered(
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.3),
                                                              BlendMode
                                                                  .srcATop),
                                                      child: CachedNetworkImage(
                                                          imageUrl:
                                                              "https://media.istockphoto.com/id/1412718411/vector/wedding-invitation-with-autumn-flowers-and-leaves-in-red-yellow-warm-and-golden-colours-with.jpg?s=612x612&w=0&k=20&c=Amb7kuEZHQ3v5cRaGPx4gXV6auEvTvAtSiXzI3u3Hlc=",
                                                          width: 300,
                                                          height: 200,
                                                          fit: BoxFit.cover),
                                                    ),
                                                    CachedNetworkImage(
                                                        imageUrl:
                                                            "https://media.istockphoto.com/id/1412718411/vector/wedding-invitation-with-autumn-flowers-and-leaves-in-red-yellow-warm-and-golden-colours-with.jpg?s=612x612&w=0&k=20&c=Amb7kuEZHQ3v5cRaGPx4gXV6auEvTvAtSiXzI3u3Hlc=",
                                                        fit: BoxFit.cover),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: -17,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 150,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 10,
                                                            color: Colors.grey)
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Text(
                                                    "Card Title Name",
                                                    style: Get
                                                        .textTheme.labelLarge!,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          vertical2,
                                          verticalhalf,
                                          Text(
                                            "Card Category",
                                            style: Get.textTheme.bodyMedium!
                                                .copyWith(color: Colors.grey),
                                          ),
                                          verticalhalf,
                                          Text(
                                            "\$${math.Random().nextInt(100)}.00",
                                            style: Get.textTheme.titleMedium,
                                          )
                                        ],
                                      ),
                                    )),
                          ),
                        ),
                        vertical,
                        Row(
                          children: [
                            horizontal2,
                            Text(
                              "Category Cards",
                              style: Get.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        verticalhalf,
                        // for (int i in List.generate(12, (D) => D))
                        //   Padding(
                        //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        //     child: Card(
                        //       child: InkWell(
                        //         onTap: () {
                        //           // Get.to(() => CardCategoryPage(
                        //           //       Category: "Hindu Marridge Card",
                        //           //     ));
                        //           Get.toNamed(AppRoutes.cardCategory,
                        //               parameters: {
                        //                 "AccountType": "CardCategory",
                        //                 "Category": "Category $i",
                        //                 "name": "Hindu Merrage Card"
                        //               });
                        //         },
                        //         child: Row(
                        //           children: [
                        //             Container(
                        //               // height: 120,
                        //               width: 140,
                        //               child: CachedNetworkImage(
                        //                 imageUrl:
                        //                     "https://image.wedmegood.com/e-invite-images/95bbfee1-491e-4b85-b4ee-eac7f706d9b5-bgImage.JPEG",
                        //                 fit: BoxFit.cover,
                        //               ),
                        //             ),
                        //             horizontal2,
                        //             Expanded(
                        //               child: Column(
                        //                 children: [
                        //                   Text(
                        //                     "Hindu Marriage Invitation Card",
                        //                     style: Get.textTheme.titleSmall!
                        //                         .copyWith(fontSize: 16),
                        //                     textAlign: TextAlign.center,
                        //                   ),
                        //                   Text(
                        //                     "Golden Theme Based Card",
                        //                     style: Get.textTheme.bodyMedium!
                        //                         .copyWith(color: Colors.grey),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //             horizontal2,
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   )
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: Get.height +
                                (Get.height +
                                    (Get.height -
                                        MediaQuery.of(Get.context!)
                                            .padding
                                            .top -
                                        MediaQuery.of(Get.context!)
                                            .padding
                                            .bottom)),
                          ),
                          child: GridView.builder(
                            // controller: _vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisExtent: 250,
                                    maxCrossAxisExtent: 300),
                            itemCount: 10, // Example item count
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  color: Colors.amber.shade50,
                                  margin: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      verticalhalf,
                                      Expanded(
                                        child: Image.network(
                                          "https://image.wedmegood.com/e-invite-images/95bbfee1-491e-4b85-b4ee-eac7f706d9b5-bgImage.JPEG",
                                        ),
                                      ),
                                      vertical,
                                      Text(
                                        "Hindu Marriage Invitation Card",
                                        style: Get.textTheme.titleSmall!
                                            .copyWith(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Golden Theme Based Card",
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(color: Colors.grey),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      vertical,
                                    ],
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: Get.width <= 1000
                  ? BottomBar(
                      currentIndex: 0,
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
