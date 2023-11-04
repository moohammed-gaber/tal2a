import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/entities/order.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> getAll();
  Future<Either<Failure, List<Category>>> search(String searchKey);
  Future<Either<Failure, OrderEntity>> add(
      OrderData category, List<OrderItem> items);
  Future<Either<Failure, Unit>> delete(int id);
  Future<Either<Failure, List<OrderItem>>> getOrderItems(int orderId);
}
