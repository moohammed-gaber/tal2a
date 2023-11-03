import 'package:drift/drift.dart';

class OrdersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get delivery => text()();
}
