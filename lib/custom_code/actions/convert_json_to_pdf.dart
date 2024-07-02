// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:universal_io/io.dart';
import 'package:http/http.dart' as http;

Future<void> convertJsonToPdf(String program, String dateStart, String dateEnd,
    String linkImage, String nameOr, String userName) async {
  final pdf = pw.Document();

  // Tải ảnh từ URL
  final response = await http.get(Uri.parse(linkImage));
  if (response.statusCode == 200) {
    final image = pw.MemoryImage(response.bodyBytes);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Stack(children: [
              pw.Container(
                width: double.infinity,
                height: 200,
                decoration: pw.BoxDecoration(
                  color: PdfColors.grey200,
                ),
                alignment: pw.Alignment.center,
                child: pw.Padding(
                  padding: pw.EdgeInsets.all(10),
                  child: pw.Row(
                    mainAxisSize: pw.MainAxisSize.min,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Stack(
                          alignment: pw.Alignment.center,
                          children: [
                            pw.Opacity(
                              opacity: 0.3,
                              child: pw.Align(
                                alignment: pw.Alignment.center,
                                child: pw.Icon(
                                  pw.IconData(0xf091),
                                  color: PdfColors.amber,
                                  size: 60,
                                ),
                              ),
                            ),
                            pw.Align(
                              alignment: pw.Alignment.center,
                              child: pw.Column(
                                mainAxisSize: pw.MainAxisSize.min,
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  pw.Text(
                                    'Độc lập - Tự do - Hạnh phúc',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  pw.SizedBox(height: 6),
                                  pw.Text(
                                    'Chứng nhận',
                                    style: pw.TextStyle(
                                      color: PdfColors.red,
                                      fontSize: 16,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.SizedBox(height: 6),
                                  pw.Text(
                                    'Nhân viên phát triển phần mềm',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.SizedBox(height: 2),
                                  pw.Text(
                                    userName,
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  pw.Text(
                                    'Đã hoàn thành: \"$program\"',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  pw.Text(
                                    'Từ ngày $dateStart đến ngày $dateEnd',
                                    textAlign: pw.TextAlign.center,
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontStyle: pw.FontStyle.italic,
                                    ),
                                  ),
                                  pw.SizedBox(height: 6),
                                  // pw.Row(
                                  //   mainAxisAlignment:
                                  //       pw.MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     pw.Expanded(
                                  //       child: pw.Container(),
                                  //     ),
                                  //     pw.Expanded(
                                  //       child: pw.Container(
                                  //         height: 50,
                                  //         child: pw.Column(
                                  //           mainAxisAlignment:
                                  //               pw.MainAxisAlignment.center,
                                  //           children: [
                                  //             pw.Text(
                                  //               nameOr,
                                  //               style: pw.TextStyle(
                                  //                 fontSize: 12,
                                  //               ),
                                  //             ),
                                  //             pw.Text(
                                  //               'Giám đốc',
                                  //               style: pw.TextStyle(
                                  //                 fontSize: 12,
                                  //                 fontWeight:
                                  //                     pw.FontWeight.bold,
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.Positioned(
                top: 10,
                right: 10,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.ClipRRect(
                      horizontalRadius: 15,
                      verticalRadius: 15,
                      child: pw.Image(
                        image,
                        width: 30,
                        height: 30,
                        fit: pw.BoxFit.cover,
                      ),
                    ),
                    pw.Text(
                      nameOr,
                      textAlign: pw.TextAlign.right,
                      style: pw.TextStyle(
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    );

    String directoryPath;
    if (io.Platform.isAndroid) {
      directoryPath = '/storage/emulated/0/Download';
    } else if (io.Platform.isIOS) {
      directoryPath = (await getApplicationDocumentsDirectory()).path;
    } else {
      throw UnsupportedError('Nền tảng không được hỗ trợ');
    }

    final filePath = '$directoryPath/example.pdf';
    final file = io.File(filePath);
    await file.writeAsBytes(await pdf.save());
  } else {
    throw Exception('Không thể tải ảnh từ URL');
  }
}
