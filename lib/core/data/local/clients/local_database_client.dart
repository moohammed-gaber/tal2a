import 'package:cashier/app/infrastructure/tables_schema/category_table.dart';
import 'package:cashier/app/infrastructure/tables_schema/items_table.dart';
import 'package:cashier/app/infrastructure/tables_schema/order_items_table.dart';
import 'package:cashier/app/infrastructure/tables_schema/orders_table.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../connection/connection.dart' as impl;
part 'local_database_client.g.dart';

@LazySingleton()
@DriftDatabase(
  tables: [CategoriesTable, ItemsTable, OrdersTable, OrderItemsTable],
)
class LocalDatabaseClient extends _$LocalDatabaseClient {
  LocalDatabaseClient() : super(impl.connect());

  @override
  int get schemaVersion => 1;
  Future<void> createTables(Migrator migrator) async {
    await migrator.createTable(categoriesTable);
    await migrator.createTable(itemsTable);
    await migrator.createTable(ordersTable);
    await migrator.createTable(orderItemsTable);
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, from, to) async {
        await dropTables(m);
        await createTables(m);
      },
      onCreate: (m) async {
        await createTables(m);
      },
    );
  }

  Future<void> dropTables(Migrator m) async {
    await m.drop(categoriesTable);
    await m.drop(itemsTable);
    await m.drop(ordersTable);
    await m.drop(orderItemsTable);
  }
}
