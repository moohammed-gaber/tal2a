import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/entities/order.dart';
import 'package:cashier/app/domain/repositories/Items_repo.dart';
import 'package:cashier/app/domain/repositories/orders_repo.dart';
import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart' hide Order;

@LazySingleton(as: OrdersRepo)
class OrdersRepoImpl implements OrdersRepo {
  final LocalDatabaseClient localDatabaseClient;

  OrdersRepoImpl(this.localDatabaseClient);

  Future<Either<Failure, List<OrderEntity>>> getAll() async {
    final result = await (localDatabaseClient
            .select(localDatabaseClient.ordersTable)
          ..orderBy([
            (tbl) =>
                OrderingTerm(expression: tbl.orderId, mode: OrderingMode.asc)
          ]))
        .get();

    return right(result.map((e) => OrderEntity.fromTable(e)).toList());
  }

  Future<Either<Failure, List<OrderItem>>> getOrderItems(int orderId) async {
    final result = await localDatabaseClient.customSelect("""
        SELECT * FROM order_items_table INNER JOIN items_table ON order_items_table.order_items_item_id = items_table.item_id INNER JOIN categories_table ON categories_table.category_id = items_table.category_id WHERE order_items_table.order_items_order_id =?;
    """, variables: [Variable.withInt(orderId)]).get();
    print(result.map((e) => OrderItem.fromMap(e.data)));
    return right(result.map((e) => OrderItem.fromMap(e.data)).toList());
  }

  @override
  Future<Either<Failure, OrderEntity>> add(
      OrderData item, List<OrderItem> items) async {
    final result = await localDatabaseClient
        .into(localDatabaseClient.ordersTable)
        .insertReturning(
          item.toTable(),
        );
    final order = OrderEntity.fromTable(result);
    localDatabaseClient.batch((batch) => batch.insertAll(
        localDatabaseClient.orderItemsTable,
        items.map((e) => OrderItemsTableCompanion.insert(
            orderItemsQuantity: e.quantity,
            orderItemsItemId: e.item.id,
            orderItemsOrderId: order.id))));
    return right(order);
  }

  Future<Either<Failure, Unit>> delete(int id) async {
    final statement = localDatabaseClient
        .delete(localDatabaseClient.ordersTable)
      ..where((tbl) => tbl.orderId.equals(id));
    await statement.go();
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Category>>> search(String searchKey) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
