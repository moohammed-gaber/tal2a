import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:drift/src/runtime/data_class.dart';
import 'package:flutter/material.dart';

class Item {
  final int id;
  final ItemData data;

  const Item({
    required this.id,
    required this.data,
  });

  factory Item.fromTable(ItemsTableData data,) => Item(
        id: data.id,
        data: ItemData.fromTable(data,),
      );
}

class ItemData {
  final String title;
  final Category category;

  const ItemData({
    required this.title,
    required this.category,
  });

  factory ItemData.fromTable(ItemsTableData data,) =>
      ItemData(title: data.title, category: Category(id: 1, data: CategoryData(title: 'title')));

  Insertable<ItemsTableData> toTable() {
    //
    return ItemsTableCompanion.insert(
      title: title,
      categoryId: category.id,
    );
  }

  factory ItemData.fromForm({required Map<String, dynamic> data}) =>
      ItemData(title: data['title'], category: data['category_id']);
}
