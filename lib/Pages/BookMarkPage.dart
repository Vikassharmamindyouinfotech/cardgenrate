import 'dart:math' as math;

import 'package:cardgenrate/Pages/VideoBuild.dart';
import 'package:cardgenrate/Pages/VideoView.dart';
import 'package:cardgenrate/Widgets/BottomBar.dart';
import 'package:cardgenrate/Pages/CardBuild.dart';
import 'package:cardgenrate/Widgets/SideBar.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:cardgenrate/Widgets/videoBlocks.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class BookMarkPage extends StatelessWidget {
  BookMarkPage({super.key});
  final _pageController = PageController();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Scaffold(
              // floatingActionButton: ,
              appBar: AppBar(
                elevation: 0,
                title: Text("My BookMarks"),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                _pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              },
                              child: Text(
                                "Invitation Cards",
                              )),
                          TextButton(
                            onPressed: () {
                              _pageController.animateToPage(1,
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.bounceIn);
                            },
                            child: Text(
                              "Video Card",
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          children: [
                            invitationCard(null),
                            kIsWeb
                                ? Center(
                                    child: DownloadAppPromptDialog(),
                                  )
                                : invitationCard(true)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Get.width <= 1000
                  ? BottomBar(
                      currentIndex: 1,
                    )
                  : null),
        ),
        if (kIsWeb && Get.width > 1000)
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400), child: SideBar())
      ],
    );
  }

  invitationCard(video) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: StaggeredGrid.extent(
        maxCrossAxisExtent: Get.width > 700 ? 500 : 220,
        children: [
          for (int i in List.generate(39, (index) => index + 1))
            Card(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  if (video != null && kIsWeb) {
                    Get.dialog(
                      DownloadAppPromptDialog(),
                    );
                  } else {
                    video != null
                        ? Get.to(() => VideoView())
                        : Get.to(() => CardBuild());
                  }
                  // Get.to(() => CardBuild());
                },
                child: Container(
                    height: Get.width > 700
                        ? (i.isOdd ? 200 : 100) * 2.3
                        : i.isOdd
                            ? 300
                            : 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3)),
                          child: video != null
                              ? Image.network(
                                  height: Get.width > 700
                                      ? ((i.isOdd ? 200 : 100) * 2.3) - 100
                                      : i.isOdd
                                          ? 200
                                          : 100,
                                  // width: 220,
                                  fit: BoxFit.fill,
                                  "https://i0.wp.com/invitemart.com/wp-content/uploads/2022/05/caricature-wedding-invitations-gif-card.gif?fit=400%2C844&ssl=1")
                              : Image.network(
                                  "https://images.unsplash.com/photo-1445964047600-cdbdb873673d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1156&q=80",
                                  height: Get.width > 700
                                      ? ((i.isOdd ? 200 : 100) * 2.3) - 100
                                      : i.isOdd
                                          ? 200
                                          : 100,
                                  // width: 220,
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
              ),
            )
        ],
      ),
    );
  }
}

class DownloadAppPromptDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Download Our App'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Image(
              image: AssetImage(
                "assets/samplecard/play.jpg",
              ),
            ),
            vertical2,
            Text(
              'To use this feature, please download our app.',
              textAlign: TextAlign.center,
            ),
            vertical,
            Text('Would you like to download it now?',
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
