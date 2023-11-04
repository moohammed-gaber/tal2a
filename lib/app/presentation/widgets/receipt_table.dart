import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/main.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:flutter/material.dart' as m;

class ReceiptTable extends StatelessWidget {
  final List<OrderItem> items;
  ReceiptTable(
    this.items,
  );

  Widget buildDataCellText(String text) {
    return Center(
        child: Text(text,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 16)));
  }

  @override
  Widget build(context) {
    Widget buildColumn({required String label}) {
      return SizedBox(
          width:
              m.MediaQuery.of(navigatorKey.currentState!.context).size.width /
                  4,
          child: Center(
            child: Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                )),
          ));
    }

    return Table(
        border: TableBorder(
          top: BorderSide(width: 2),
        ),
        children: [
          TableRow(children: [
            buildColumn(label: ('المجموع')),
            buildColumn(label: ('السعر')),
            buildColumn(label: ('الكميه')),
            buildColumn(label: ('الصنف')),
          ]),
          ...items
              .map((msg) => TableRow(children: [
                    buildDataCellText(msg.totalPrice.toString()),
                    buildDataCellText(msg.item.data.price.toString()),
                    buildDataCellText(msg.quantity.toString()),
                    buildDataCellText(msg.item.data.title),
                  ]))
              .toList(),
        ]);
  }
}

class TotalTable extends StatelessWidget {
  final num deliveryPrice, totalPrice;

  TotalTable({required this.deliveryPrice, required this.totalPrice});
  Widget buildRow(String title, num value) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ Text(value.toString()),Text(title),]);
  @override
  Widget build(Context context) {
    return Column(children: [
      buildRow('سعر الدليفري', deliveryPrice),
      buildRow('الاجمالي', totalPrice),
    ]);
  }
}
