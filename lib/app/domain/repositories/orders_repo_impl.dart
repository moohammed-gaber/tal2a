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
    final statement = localDatabaseClient.delete(localDatabaseClient.itemsTable)
      ..where((tbl) => tbl.itemId.equals(id));
    await statement.go();
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Category>>> search(String searchKey) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
