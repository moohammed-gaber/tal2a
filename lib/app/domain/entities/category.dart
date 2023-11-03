import 'package:cashier/core/data/local/clients/local_database_client.dart';
import 'package:drift/src/runtime/data_class.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final CategoryData data;

  const Category({
    required this.id,
    required this.data,
  });

  factory Category.fromTable(CategoriesTableData data) => Category(
        id: data.id,
        data: CategoryData.fromTable(data),
      );
}

class CategoryData {
  final String title;

  const CategoryData({
    required this.title,
  });

  factory CategoryData.fromTable(CategoriesTableData data) => CategoryData(
        title: data.title,
      );

  Insertable<CategoriesTableData> toTable() {
    return CategoriesTableCompanion.insert(
      title: title,
    );
  }

  factory CategoryData.fromForm({required Map<String, dynamic> data}) =>
      CategoryData(
        title: data['title'],
      );
}
