import 'dart:ffi';

import 'package:cardgenrate/Pages/VideoBuild.dart';
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class VideoView extends StatelessWidget {
  VideoView({super.key});
  final controller = Get.put(VideoViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => Opacity(
          opacity: 0.8,
          child: FloatingActionButton(
              heroTag: "vol",
              onPressed: () {
                controller.controller.value.value.volume > 0
                    ? controller.controller.value.setVolume(0)
                    : controller.controller.value.setVolume(10);
                controller.controller.update(controller.controller);
              },
              child: Icon(controller.controller.value.value.volume > 0
                  ? Icons.volume_up_rounded
                  : Icons.volume_off_rounded)),
        ),
      ),
      appBar: AppBar(
        title: Text("Video Invitation Name"),
      ),
      body: Obx(
        () => controller.controller.value.value.isInitialized
            ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.controller.value.value.isPlaying
                              ? controller.controller.value.pause()
                              : controller.controller.value.play();
                          controller.controller.update(controller.controller);
                        },
                        child: AspectRatio(
                          aspectRatio:
                              controller.controller.value.value.aspectRatio,
                          child: VideoPlayer(controller.controller.value),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Opacity(
                      opacity: controller.controller.value.value.isPlaying &&
                              !controller.controller.value.value.isCompleted
                          ? 0
                          : 0.3,
                      child: IconButton.filled(
                        icon: Icon(controller.controller.value.value.isPlaying
                            ? Icons.pause_circle
                            : Icons.play_circle_outline_rounded),
                        onPressed: () {
                          controller.controller.value.value.isPlaying
                              ? controller.controller.value.pause()
                              : controller.controller.value.play();
                          controller.controller.update(controller.controller);
                        },
                      ),
                    ),
                  )
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
      bottomNavigationBar: FloatingActionButton.extended(
        label: Text("Start Creating"),
        onPressed: () {
          Get.delete<VideoViewController>();
          Get.off(() => VideoBuilder());
          // Get.to();
        },
      ),
    );
  }
}

class VideoViewController extends GetxController {
  final controller = VideoPlayerController.networkUrl(Uri.parse(
          "https://videoinvites.wedmegood.com/1707462831519WMG+Jaipur+Tales.mp4"))
      .obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // controller = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://videoinvites.wedmegood.com/1707462831519WMG+Jaipur+Tales.mp4"));
    ini();
  }

  ini() async {
    await controller.value.initialize().whenComplete(() {
      controller.update(controller);
    });

    await controller.value.play();
    controller.value.addListener(
      () {
        if (controller.value.value.isCompleted) {
          controller.value.pause();
          controller.update(controller);
        }
      },
    );
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controller.value.dispose();
  }
}
