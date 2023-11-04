import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/presentation/widgets/receipt_table.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PrintArguments {
  final List<OrderItem> items;
  final num deliveryPrice, totalPrice;

  PrintArguments({
    required this.items,
    required this.totalPrice,
    required this.deliveryPrice,
  });
}

@LazySingleton()
class DevicePrinter {
  Future<bool> printReceipt(PrintArguments arguments) async {
    final logo = MemoryImage(
      (await rootBundle.load('assets/images/logo.jpg')).buffer.asUint8List(),
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
            theme: ThemeData(
                defaultTextStyle: TextStyle(font: arabicFont, fontSize: 16)),
            pageFormat: PdfPageFormat.a6,
            build: (Context context) {
              return [
                Center(
                    child: Image(logo,
                        fit: BoxFit.contain, height: 200, width: 200)),
                SizedBox(height: 10),
                ReceiptTable(arguments.items),
                Divider(),
                TotalTable(
                    deliveryPrice: arguments.deliveryPrice,
                    totalPrice: arguments.totalPrice)
              ];
            }),
      );
      return pdf.save();
    });
  }
}
