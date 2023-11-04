import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<Category>>> getAll();
  Future<Either<Failure, List<Category>>> search(String searchKey);
  Future<Either<Failure, Category>> add(CategoryData category);
  Future<Either<Failure, Unit>> delete(int id);
}
