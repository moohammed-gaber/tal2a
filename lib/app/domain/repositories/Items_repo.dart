import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ItemsRepo {
  Future<Either<Failure, List<Item>>> getAll();
  Future<Either<Failure, Item>> add(ItemData item);
  Future<Either<Failure, Unit>> delete(int id);
  Future<Either<Failure, List<Item>>> search(String search);
}
