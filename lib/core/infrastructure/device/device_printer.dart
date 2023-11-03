import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class DevicePrinter {
  static Future<bool> printReceipt() async {
    final logo = MemoryImage(
      (await rootBundle.load('assets/images/logo.png')).buffer.asUint8List(),
    );
    final arabicFont =
        Font.ttf(await rootBundle.load("assets/fonts/hacen/hacen_tunisia.ttf"));
    return Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final Document pdf = Document();
      pdf.addPage(
        MultiPage(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            margin: EdgeInsets.all(0),
            // pageFormat: PdfPageFormat.a4,
            theme: ThemeData(
                defaultTextStyle: TextStyle(font: arabicFont, fontSize: 16)),
            pageFormat: PdfPageFormat.a6,
            build: (Context context) {
              return [
              ];
            }),
      );
      return pdf.save();
    });
  }

}