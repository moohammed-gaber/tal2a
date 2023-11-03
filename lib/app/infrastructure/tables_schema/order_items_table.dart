import 'package:cashier/app/infrastructure/tables_schema/items_table.dart';
import 'package:cashier/app/infrastructure/tables_schema/orders_table.dart';
import 'package:drift/drift.dart';

class OrderItemsTable extends Table {
  IntColumn get itemId => integer().references(ItemsTable, #id)();
  IntColumn get orderId => integer().references(OrdersTable, #id)();
}
