import 'package:cardgenrate/Widgets/tools.dart';
import 'package:cardgenrate/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ExportVideo extends StatelessWidget {
  ExportVideo({super.key});
  final controller = Get.put(VideoExportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => Opacity(
          opacity: controller.controller.value.value.isInitialized ? 0.8 : 0,
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
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: AlertDialog(
                    title: Text("Exportting Video"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )),
                        vertical,
                        Text("Good things take time...")
                      ],
                    ),
                  ),
                )),
      ),
      bottomNavigationBar: FloatingActionButton.extended(
        label: Text("Download and Share"),
        onPressed: () {
          Get.offAllNamed(AppRoutes.home);
          // Get.delete<VideoExportController>();
          // Get.off(() => VideoBuilder());
          // Get.to();
        },
      ),
    );
  }
}

class VideoExportController extends GetxController {
  final controller = VideoPlayerController.networkUrl(Uri.parse(
          "https://videoinvites.wedmegood.com/1707462831519WMG+Jaipur+Tales.mp4"))
      .obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // controller = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://videoinvites.wedmegood.com/1707462831519WMG+Jaipur+Tales.mp4"));
    Future.delayed(Duration(seconds: 10), ini);
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
