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
        id: data.categoryId,
        data: CategoryData.fromTable(data),
      );

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['category_id'] as int,
      data: CategoryData.fromMap(map),
    );
  }
}

class CategoryData {
  final String title;

  const CategoryData({
    required this.title,
  });

  factory CategoryData.fromTable(CategoriesTableData data) => CategoryData(
        title: data.categoryTitle,
      );

  Insertable<CategoriesTableData> toTable() {
    return CategoriesTableCompanion.insert(
      categoryTitle: title,
    );
  }

  factory CategoryData.fromForm({required Map<String, dynamic> data}) =>
      CategoryData(
        title: data['title'],
      );

  factory CategoryData.fromMap(Map<String, dynamic> map) {
    return CategoryData(
      title: map['category_title'] as String,
    );
  }
}
