import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:cardgenrate/modals/TextFormModal.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cardgenrate/Widgets/tools.dart';
import 'package:http/http.dart' as http;
// import 'dart:html' as html;
import 'package:printing/printing.dart';

saveinweb(ex, controller) async {
  ex.exportstatus.value = "Getting Paths...";
  // Directory directory = kIsWeb
  //     ? await p.
  //     : await path.getApplicationDocumentsDirectory();
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
                      fit: pw.BoxFit.cover, image: pw.MemoryImage(firstimage))),
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
                          fontSize: i.fontSize)),
                ),
              )
          ],
        ),
      );
    },
  ));
  ex.exportstatus.value = "Exporting...";
  Get.back();
  await Printing.layoutPdf(
    onLayout: (format) async {
      // await pdf.save();
      return await pdf.save();
    },
  );
//     List<int> fileInts = List.from(  await pdf.save());
//  html.AnchorElement(
//     href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
//   ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
//   ..click();
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

          final http.Response fontResponse =
              await http.get(Uri.parse(ttfUrl.replaceAll('http:', 'https:')));
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
