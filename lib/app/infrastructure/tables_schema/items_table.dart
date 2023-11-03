import 'package:cashier/app/infrastructure/tables_schema/category_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/drift.dart';

class ItemsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get categoryId => integer().references(CategoriesTable, #id)();
}
