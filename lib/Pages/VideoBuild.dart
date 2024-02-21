import 'dart:developer';
import 'dart:typed_data';

import 'package:cardgenrate/Pages/ExportVIdeoCard.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class VideoBuilder extends StatelessWidget {
  VideoBuilder({super.key});
  final controller = Get.put(VideoEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2, title: Text('Video Card Name')),
      bottomNavigationBar: FloatingActionButton.extended(
        label: Text("Next "),
        onPressed: () async {
          // final pre = await controller.controller.value.position;
          // if (controller.durpoint.last == pre) {
          Get.off(() => ExportVideo());
          // } else {
          //   log("${controller.dur.indexOf(pre) + 1}cvcv ");
          //   try {
          //     controller.controller.value.seekTo(
          //         controller.dur.elementAt(controller.dur.indexOf(pre) + 1));
          //   } catch (e) {
          //     // log(e.to)
          //   }
          // }
        },
      ),
      body: Column(children: [
        Expanded(
          child: Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Obx(
              () => controller.controller.value.value.isInitialized
                  ? Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                // controller.controller.value.value.isPlaying
                                //     ? controller.controller.value.pause()
                                //     : controller.controller.value.play();
                                // controller.controller
                                //     .update(controller.controller);
                              },
                              child: AspectRatio(
                                aspectRatio: controller
                                    .controller.value.value.aspectRatio,
                                child: VideoPlayer(controller.controller.value),
                              ),
                            ),
                          ),
                        ),
                        // Center(
                        //   child: Opacity(
                        //     opacity: controller
                        //                 .controller.value.value.isPlaying &&
                        //             !controller.controller.value.value.isCompleted
                        //         ? 0
                        //         : 0.3,
                        //     child: IconButton.filled(
                        //       icon: Icon(
                        //           controller.controller.value.value.isPlaying
                        //               ? Icons.pause_circle
                        //               : Icons.play_circle_outline_rounded),
                        //       onPressed: () {
                        //         // controller.controller.value.value.isPlaying
                        //         //     ? controller.controller.value.pause()
                        //         //     : controller.controller.value.play();
                        //         // controller.controller
                        //         //     .update(controller.controller);
                        //       },
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(children: [
                          CircularProgressIndicator(),
                          vertical,
                          Text("Loading...")
                        ]),
                      ),
                    ),
            ),
          ),
        ),
        Divider(
          height: 2,
          thickness: 1,
        ),
        SizedBox(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                          "${controller.dur.indexOf(controller.controller.value.position)}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Label Name 1"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    vertical2,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Label Name 2"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    vertical2,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Label Name 3"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    vertical2,
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}

class VideoEditingController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ini();
  }

  List<Duration> durpoint = [];
  final controller = VideoPlayerController.networkUrl(Uri.parse(
          "https://videoinvites.wedmegood.com/1707462831519WMG+Jaipur+Tales.mp4"))
      .obs;

  //cutting Duration For temp Purpose
  List<Duration> cutDurationIntoThreeEqualParts(Duration duration, int n) {
    List<Duration> result = [];
    result.add(Duration.zero);
    var diff = ((duration.inMicroseconds / n).floor()) - 4;
    while (result.length < n + 1) {
      result.add(Duration(microseconds: result.last.inMicroseconds + diff));
    }
    return result;
  }

  RxList<Duration> dur = <Duration>[].obs;
  ini() async {
    await controller.value.initialize().whenComplete(() {
      controller.update(controller);
    });
    dur.value =
        cutDurationIntoThreeEqualParts(controller.value.value.duration, 3);
    log("${dur.value}");
    controller.value.seekTo(dur.first);

    // await controller.value.play();
    controller.value.addListener(
      () {
        if (controller.value.value.isCompleted) {
          controller.value.pause();
          controller.update(controller);
        }
      },
    );
  }

  Rx<Uint8List> videodata = Uint8List(0).obs;
  downloadVideo() async {
    //download video
    try {
      await http
          .get(Uri.parse(
              "https://videoinvites.wedmegood.com/1681459158568Soulmates.mp4"))
          .then((res) {
        videodata.value = res.bodyBytes;
      });
    } catch (e) {}
  }
}
