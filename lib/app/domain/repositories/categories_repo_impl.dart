import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/repositories/categories_repo.dart';
import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final LocalDatabaseClient localDatabaseClient;

  CategoriesRepoImpl(this.localDatabaseClient);

  @override
  Future<Either<Failure, List<Category>>> getAll() async {
    final result = await (localDatabaseClient
            .select(localDatabaseClient.categoriesTable)
          ..orderBy([
            (tbl) =>
                OrderingTerm(expression: tbl.categoryId, mode: OrderingMode.asc)
          ]))
        .get();

    return right(result.map((e) => Category.fromTable(e)).toList());
  }

  //add
  @override
  Future<Either<Failure, Category>> add(CategoryData category) async {
    final result = await localDatabaseClient
        .into(localDatabaseClient.categoriesTable)
        .insertReturning(
          category.toTable(),
        );
    return right(Category.fromTable(result));
  }

  @override
  Future<Either<Failure, Unit>> delete(int id) async {
    final statement = localDatabaseClient
        .delete(localDatabaseClient.categoriesTable)
      ..where((tbl) => tbl.categoryId.equals(id));
    await statement.go();
    return right(unit);
  }

  @override
  Future<Either<Failure, List<Category>>> search(String searchKey) async {
    final query = localDatabaseClient
        .select(localDatabaseClient.categoriesTable)
      ..where((tbl) => localDatabaseClient.categoriesTable.categoryTitle
          .like('%$searchKey%'));
    final result = await query.get();
    return right(result.map((e) => Category.fromTable(e)).toList());
  }
}
