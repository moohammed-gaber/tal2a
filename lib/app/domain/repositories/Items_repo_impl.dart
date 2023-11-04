import 'package:cashier/app/domain/entities/category.dart';
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
    final result = await localDatabaseClient.customSelect("""
        SELECT * FROM items_table INNER JOIN categories_table ON categories_table.category_id = items_table.category_id;
    
    """).get();
    return right(result.map((e) => Item.fromMap(e.data)).toList());
  }

  @override
  Future<Either<Failure, Item>> add(ItemData item) async {
    final result = await localDatabaseClient
        .into(localDatabaseClient.itemsTable)
        .insertReturning(
          item.toTable(),
        );
    final query = localDatabaseClient.select(localDatabaseClient.categoriesTable)
      ..where((tbl) => tbl.categoryId.equals(result.categoryId));
    final category = await query.getSingle();

    return right(Item.fromTable(result,Category.fromTable(category)));
  }

  Future<Either<Failure, Unit>> delete(int id) async {
    final statement = localDatabaseClient.delete(localDatabaseClient.itemsTable)
      ..where((tbl) => tbl.itemId.equals(id));
    await statement.go();
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Item>>> search(String search) async {
    final result = await localDatabaseClient.customSelect("""
        SELECT * FROM items_table INNER JOIN categories_table ON categories_table.category_id = items_table.category_id WHERE items_table.item_title LIKE '%$search%';
    """).get();
    return right(result.map((e) => Item.fromMap(e.data)).toList());
  }
}
