import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:drift/src/runtime/data_class.dart';
import 'package:flutter/material.dart';

class OrderItem {
  final Item item;
  final int quantity;
  num get totalPrice => item.data.price * quantity;

  OrderItem({required this.item, required this.quantity});

  OrderItem copyWith({
    Item? item,
    int? quantity,
  }) {
    return OrderItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      item: Item.fromMap(map),
      quantity: map['order_items_quantity'] as int,
    );
  }
}

class Item {
  final int id;
  final ItemData data;

  const Item({
    required this.id,
    required this.data,
  });
  factory Item.fromTable(ItemsTableData data, Category category) => Item(
        id: data.itemId,
        data: ItemData.fromTable(data, category),
      );
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['item_id'] as int,
      data: ItemData.fromMap(map),
    );
  }
}

class ItemData {
  final String title;
  final Category category;
  final num price;

  const ItemData({
    required this.title,
    required this.price,
    required this.category,
  });
  factory ItemData.fromTable(ItemsTableData data, Category category) =>
      ItemData(
          price: data.itemPrice, title: data.itemTitle, category: category);

  Insertable<ItemsTableData> toTable() {
    return ItemsTableCompanion.insert(
      itemTitle: title,
      itemPrice: price.toDouble(),
      categoryId: category.id,
    );
  }

  factory ItemData.fromForm({required Map<String, dynamic> data}) => ItemData(
      price: data['price'],
      title: data['title'],
      category: data['category_id']);

  factory ItemData.fromMap(Map<String, dynamic> map) {
    return ItemData(
      price: (map['item_price'] as double),
      title: map['item_title'] as String,
      category: Category.fromMap(map),
    );
  }
}
