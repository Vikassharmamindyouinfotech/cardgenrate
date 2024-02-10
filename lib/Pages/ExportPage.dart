import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:cardgenrate/modals/TextFormModal.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
// import 'package:share_plus/share_plus.dart';
import 'CardBuild.dart';
import 'package:pdf/widgets.dart' as pw;

class ExportPage extends StatelessWidget {
  ExportPage({super.key});
  final controller = Get.find<NameController>();
  final ex = Get.put(ExportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Export Card Name"),
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
              for (var i in controller.texts)
                Positioned(
                  left: i.left,
                  top: i.top,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 10),
                    child: Text(i.text,
                        style: i.textStyle!.copyWith(fontSize: i.fontSize)),
                  ),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: FloatingActionButton.extended(
        label: Text("Export As Pdf"),
        onPressed: () {
          Get.dialog(
            Dialog(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                vertical2,
                Text(
                  "Exporting",
                  style: Get.textTheme.titleLarge,
                ),
                vertical2,
                vertical2,
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
                Obx(
                  () => Text(
                    ex.exportstatus.value,
                    style:
                        Get.textTheme.bodyMedium!.copyWith(color: Colors.grey),
                  ),
                ),
                vertical2,
              ]),
            ),
            barrierDismissible: false,
          );
          PdfWork();
        },
      ),
    );
  }

  PdfWork() async {
    ex.exportstatus.value = "Getting Paths...";
    Directory directory = await path.getApplicationDocumentsDirectory();
    //load image
    ex.exportstatus.value = "Loading Images...";

    final firstimage =
        await http.get(Uri.parse(tempimage.first)).then((c) => c.bodyBytes);
    log(controller.textFormModal.value.textStyle.fontFamilyFallback!.first
        .toString());
    ex.exportstatus.value = "Loading fonts...";

    //load font
    List ttf = [];

    try {
      log("font load");
      ttf = await downloadfont(controller.texts.value);
    } catch (e) {
      log(e.toString());
    }

    ex.exportstatus.value = "Genarating ...";
    //start widget
    final pdf = pw.Document();
    ex.exportstatus.value = "Adding Pages...";
    pdf.addPage(pw.Page(
      margin: pw.EdgeInsets.zero,
      pageFormat: PdfPageFormat.standard,
      build: (context) {
        return pw.Container(
          height: PdfPageFormat.standard.height,
          width: PdfPageFormat.standard.width,
          child: pw.Stack(
            children: [
              pw.Container(
                decoration: pw.BoxDecoration(
                    image: pw.DecorationImage(
                        fit: pw.BoxFit.cover,
                        image: pw.MemoryImage(firstimage))),
              ),
              for (var i in controller.texts)
                pw.Positioned(
                  left: i.left,
                  top: i.top,
                  child: pw.ConstrainedBox(
                    constraints: pw.BoxConstraints(minWidth: 10),
                    child: pw.Text(i.text,
                        style: pw.TextStyle(
                            color: PdfColor(
                                (i.color.red / 255).toDouble(),
                                (i.color.green / 255).toDouble(),
                                (i.color.blue / 255).toDouble()),
                            font: pw.Font.ttf(ByteData.view(
                                ttf[controller.texts.indexOf(i)].buffer)),
                            fontSize: controller.textFormModal.value.fontSize)),
                  ),
                )
            ],
          ),
        );
      },
    ));
    ex.exportstatus.value = "Exporting...";
    Get.back();
    await Printing.sharePdf(
      bytes: await pdf.save(),
    );
    // XFile.;
    // final c = File
    // FlutterShare.shareFile(filePath: )
    // getExternalStorageDirectories(
    //     type: path.StorageDirectory.documents);

    // try {
    //   final outputpath = await path.getExternalStorageDirectories(
    //       type: path.StorageDirectory.downloads);
    //   final file = File(outputpath!.first.path.toString() + "/example.pdf");
    //   await file.writeAsBytes(await pdf.save());
    //   // await FlutterShare.shareFile(
    //   //     filePath: file.path,
    //   //     title: "Wedding_Card",
    //   //     text: "Wedding Card",
    //   //     chooserTitle: "df");
    //   // log(outputpath!.path.toString() + "/example.pdf");
    // } catch (e) {
    //   log(e.toString());
    // }
    // await Share.share("ss");
    // await Share.shareXFiles([XFile.fromData(await pdf.save())]);
    //Export to download
    // FlutterDownloader.
  }
}

// controller.textFormModal.value.textStyle!.copyWith(
//                           fontSize: controller.textFormModal.value.fontSize)
Future<List<Uint8List>> downloadfont(List<TextFormModal> fontfamilys) async {
  final String apiKey = 'AIzaSyBE6vP51pMzqxGJZOGUDabCpSrvqLbyaHI';

  log("sfddf ${fontfamilys.map(
        (e) => e.textStyle.fontFamilyFallback!.first,
      ).toList()}");
  final font = await downloadGoogleFont(
      apiKey,
      fontfamilys
          .map(
            (e) => e.textStyle.fontFamilyFallback!.first,
          )
          .toList());
  return font;
  // return outputPath;
}

Future<List<Uint8List>> downloadGoogleFont(
    String apiKey, List fontFamilys) async {
  final String url =
      'https://www.googleapis.com/webfonts/v1/webfonts?key=$apiKey';
  List<Uint8List> data = [];

  try {
    final http.Response response = await http.get(Uri.parse(url));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> fontData = json.decode(response.body);
      final List<dynamic> items = fontData['items'];
      for (var element in fontFamilys) {
        final font = items.firstWhere((font) => font['family'] == element);

        if (font != null) {
          final Map<String, dynamic> files = font['files'];
          final String ttfUrl = files['regular'];

          final http.Response fontResponse = await http.get(Uri.parse(ttfUrl));
          log(fontResponse.statusCode.toString() + "34");
          if (fontResponse.statusCode == 200) {
            data.add(fontResponse.bodyBytes);
          } else {
            log('Failed to download font file');
          }
        } else {
          log('Font not found');
        }
      }
    } else {
      log('Failed to fetch font data from Google Fonts API');
    }
  } catch (e) {
    log('Error: $e');
  }
  return data;
}

class ExportController extends GetxController {
  RxString exportstatus = "".obs;
}
