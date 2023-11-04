import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class OrderEntity {
  final int id;
  final OrderData orderData;

  OrderEntity({required this.id, required this.orderData});
  factory OrderEntity.fromTable(
    OrdersTableData data,
  ) =>
      OrderEntity(
        id: data.orderId!,
        orderData: OrderData.fromTable(
          data,
        ),
      );

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      id: map['order_id'] as int,
      orderData: OrderData.fromMap(map),
    );
  }
}

class OrderData {
  final num price, deliveryPrice;

  OrderData({required this.price, required this.deliveryPrice});
  Insertable<OrdersTableData> toTable() {
    return OrdersTableCompanion.insert(
      orderDelivery: deliveryPrice.toDouble(),
      orderPrice: price.toDouble(),
    );
  }

  factory OrderData.fromMap(Map<String, dynamic> map) {
    return OrderData(
      price: map['order_price'] as num,
      deliveryPrice: map['order_delivery'] as num,
    );
  }
  factory OrderData.fromTable(OrdersTableData data) => OrderData(
        deliveryPrice: data.orderDelivery,
        price: data.orderPrice,
      );
}
