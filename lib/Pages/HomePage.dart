import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:cardgenrate/Pages/CardCategoryDetailsPage.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wed-Arranger",
              style: GoogleFonts.pacifico(color: Colors.pink)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        label: Text("Search Cards"),
                        isDense: true,
                        hintText: "Enter Text to Search",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.1),
                            borderRadius: BorderRadius.circular(10))),
                  )),
              vertical,
              Row(
                children: [
                  horizontal2,
                  Text(
                    "Popular Cards",
                    style: Get.textTheme.titleMedium,
                  ),
                ],
              ),
              vertical,
              SizedBox(
                height: 280,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    itemBuilder: (c, i) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
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
                                              color:
                                                  Colors.pink.withOpacity(0.1))
                                        ],
                                        borderRadius: BorderRadius.only(
                                            bottomRight:
                                                Radius.elliptical(30, 50),
                                            bottomLeft:
                                                Radius.elliptical(30, 50),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                              Colors.white.withOpacity(0.3),
                                              BlendMode.srcATop),
                                          child: Image.network(
                                              width: 300,
                                              height: 200,
                                              "https://cdn-jogdf.nitrocdn.com/VdmdyyNZrFGmsIskKZBjPuoUCgJnzZpw/assets/images/optimized/rev-669cd42/www.craftyartapp.com/blog/wp-content/uploads/2023/10/a2108aedf596968c6facb55a7b009fcb-1.webp",
                                              fit: BoxFit.cover),
                                        ),
                                        Image.network(
                                            "https://cdn-jogdf.nitrocdn.com/VdmdyyNZrFGmsIskKZBjPuoUCgJnzZpw/assets/images/optimized/rev-669cd42/www.craftyartapp.com/blog/wp-content/uploads/2023/10/a2108aedf596968c6facb55a7b009fcb-1.webp",
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
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        "Card Title Name",
                                        style: Get.textTheme.labelLarge!,
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
              vertical,
              Row(
                children: [
                  horizontal2,
                  Text(
                    "Category Cards",
                    style: Get.textTheme.titleMedium,
                  ),
                ],
              ),
              verticalhalf,
              for (int i in List.generate(12, (D) => D))
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => CardCategoryPage(
                              Category: "Hindu Marridge Card",
                            ));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 140,
                            child: Image.network(
                              "https://i.pinimg.com/736x/50/9f/f8/509ff8fe5f8660d31e46fc5e90e83ddd.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          horizontal2,
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Hindu Marriage Invitation Card",
                                  style: Get.textTheme.titleSmall!
                                      .copyWith(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Golden Theme Based Card",
                                  style: Get.textTheme.bodyMedium!
                                      .copyWith(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          horizontal2,
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: 0,
        ));
  }
}
