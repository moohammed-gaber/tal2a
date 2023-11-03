import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/repositories/Items_repo.dart';
import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ItemsRepo)
 class ItemsRepoImpl implements ItemsRepo {
  final LocalDatabaseClient localDatabaseClient;

  ItemsRepoImpl(this.localDatabaseClient);

  Future<Either<Failure, List<Item>>> getAll() async {
    final result = await (localDatabaseClient
            .select(localDatabaseClient.itemsTable)
          ..join([
            leftOuterJoin(
                localDatabaseClient.itemsTable,
                localDatabaseClient.categoriesTable.id
                    .equalsExp(localDatabaseClient.itemsTable.categoryId))
          ])
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.asc)
          ]))
        .get();


    return right(result.map((e) => Item.fromTable(e)).toList());
  }

  @override
  Future<Either<Failure, Item>> add(ItemData item) async {
    final result = await localDatabaseClient
        .into(localDatabaseClient.itemsTable)
        .insertReturning(
          item.toTable(),
        );
    print(result.toJson());
    return right(Item.fromTable(result));
  }

  Future<Either<Failure, Unit>> delete(int id) async {
    return right(unit);
  }
}
