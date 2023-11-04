// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_client.dart';

// ignore_for_file: type=lint
class OrderItemsTable extends Table
    with TableInfo<OrderItemsTable, OrderItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _orderItemsIdMeta =
      const VerificationMeta('orderItemsId');
  late final GeneratedColumn<int> orderItemsId = GeneratedColumn<int>(
      'order_items_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _orderItemsItemIdMeta =
      const VerificationMeta('orderItemsItemId');
  late final GeneratedColumn<int> orderItemsItemId = GeneratedColumn<int>(
      'order_items_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _orderItemsQuantityMeta =
      const VerificationMeta('orderItemsQuantity');
  late final GeneratedColumn<int> orderItemsQuantity = GeneratedColumn<int>(
      'order_items_quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _orderItemsOrderIdMeta =
      const VerificationMeta('orderItemsOrderId');
  late final GeneratedColumn<int> orderItemsOrderId = GeneratedColumn<int>(
      'order_items_order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [orderItemsId, orderItemsItemId, orderItemsQuantity, orderItemsOrderId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrderItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('order_items_id')) {
      context.handle(
          _orderItemsIdMeta,
          orderItemsId.isAcceptableOrUnknown(
              data['order_items_id']!, _orderItemsIdMeta));
    }
    if (data.containsKey('order_items_item_id')) {
      context.handle(
          _orderItemsItemIdMeta,
          orderItemsItemId.isAcceptableOrUnknown(
              data['order_items_item_id']!, _orderItemsItemIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemsItemIdMeta);
    }
    if (data.containsKey('order_items_quantity')) {
      context.handle(
          _orderItemsQuantityMeta,
          orderItemsQuantity.isAcceptableOrUnknown(
              data['order_items_quantity']!, _orderItemsQuantityMeta));
    } else if (isInserting) {
      context.missing(_orderItemsQuantityMeta);
    }
    if (data.containsKey('order_items_order_id')) {
      context.handle(
          _orderItemsOrderIdMeta,
          orderItemsOrderId.isAcceptableOrUnknown(
              data['order_items_order_id']!, _orderItemsOrderIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemsOrderIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderItemsId};
  @override
  OrderItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemsTableData(
      orderItemsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_items_id'])!,
      orderItemsItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}order_items_item_id'])!,
      orderItemsQuantity: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}order_items_quantity'])!,
      orderItemsOrderId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}order_items_order_id'])!,
    );
  }

  @override
  OrderItemsTable createAlias(String alias) {
    return OrderItemsTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class OrderItemsTableData extends DataClass
    implements Insertable<OrderItemsTableData> {
  final int orderItemsId;
  final int orderItemsItemId;
  final int orderItemsQuantity;
  final int orderItemsOrderId;
  const OrderItemsTableData(
      {required this.orderItemsId,
      required this.orderItemsItemId,
      required this.orderItemsQuantity,
      required this.orderItemsOrderId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['order_items_id'] = Variable<int>(orderItemsId);
    map['order_items_item_id'] = Variable<int>(orderItemsItemId);
    map['order_items_quantity'] = Variable<int>(orderItemsQuantity);
    map['order_items_order_id'] = Variable<int>(orderItemsOrderId);
    return map;
  }

  OrderItemsTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemsTableCompanion(
      orderItemsId: Value(orderItemsId),
      orderItemsItemId: Value(orderItemsItemId),
      orderItemsQuantity: Value(orderItemsQuantity),
      orderItemsOrderId: Value(orderItemsOrderId),
    );
  }

  factory OrderItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemsTableData(
      orderItemsId: serializer.fromJson<int>(json['order_items_id']),
      orderItemsItemId: serializer.fromJson<int>(json['order_items_item_id']),
      orderItemsQuantity:
          serializer.fromJson<int>(json['order_items_quantity']),
      orderItemsOrderId: serializer.fromJson<int>(json['order_items_order_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'order_items_id': serializer.toJson<int>(orderItemsId),
      'order_items_item_id': serializer.toJson<int>(orderItemsItemId),
      'order_items_quantity': serializer.toJson<int>(orderItemsQuantity),
      'order_items_order_id': serializer.toJson<int>(orderItemsOrderId),
    };
  }

  OrderItemsTableData copyWith(
          {int? orderItemsId,
          int? orderItemsItemId,
          int? orderItemsQuantity,
          int? orderItemsOrderId}) =>
      OrderItemsTableData(
        orderItemsId: orderItemsId ?? this.orderItemsId,
        orderItemsItemId: orderItemsItemId ?? this.orderItemsItemId,
        orderItemsQuantity: orderItemsQuantity ?? this.orderItemsQuantity,
        orderItemsOrderId: orderItemsOrderId ?? this.orderItemsOrderId,
      );
  @override
  String toString() {
    return (StringBuffer('OrderItemsTableData(')
          ..write('orderItemsId: $orderItemsId, ')
          ..write('orderItemsItemId: $orderItemsItemId, ')
          ..write('orderItemsQuantity: $orderItemsQuantity, ')
          ..write('orderItemsOrderId: $orderItemsOrderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      orderItemsId, orderItemsItemId, orderItemsQuantity, orderItemsOrderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemsTableData &&
          other.orderItemsId == this.orderItemsId &&
          other.orderItemsItemId == this.orderItemsItemId &&
          other.orderItemsQuantity == this.orderItemsQuantity &&
          other.orderItemsOrderId == this.orderItemsOrderId);
}

class OrderItemsTableCompanion extends UpdateCompanion<OrderItemsTableData> {
  final Value<int> orderItemsId;
  final Value<int> orderItemsItemId;
  final Value<int> orderItemsQuantity;
  final Value<int> orderItemsOrderId;
  const OrderItemsTableCompanion({
    this.orderItemsId = const Value.absent(),
    this.orderItemsItemId = const Value.absent(),
    this.orderItemsQuantity = const Value.absent(),
    this.orderItemsOrderId = const Value.absent(),
  });
  OrderItemsTableCompanion.insert({
    this.orderItemsId = const Value.absent(),
    required int orderItemsItemId,
    required int orderItemsQuantity,
    required int orderItemsOrderId,
  })  : orderItemsItemId = Value(orderItemsItemId),
        orderItemsQuantity = Value(orderItemsQuantity),
        orderItemsOrderId = Value(orderItemsOrderId);
  static Insertable<OrderItemsTableData> custom({
    Expression<int>? orderItemsId,
    Expression<int>? orderItemsItemId,
    Expression<int>? orderItemsQuantity,
    Expression<int>? orderItemsOrderId,
  }) {
    return RawValuesInsertable({
      if (orderItemsId != null) 'order_items_id': orderItemsId,
      if (orderItemsItemId != null) 'order_items_item_id': orderItemsItemId,
      if (orderItemsQuantity != null)
        'order_items_quantity': orderItemsQuantity,
      if (orderItemsOrderId != null) 'order_items_order_id': orderItemsOrderId,
    });
  }

  OrderItemsTableCompanion copyWith(
      {Value<int>? orderItemsId,
      Value<int>? orderItemsItemId,
      Value<int>? orderItemsQuantity,
      Value<int>? orderItemsOrderId}) {
    return OrderItemsTableCompanion(
      orderItemsId: orderItemsId ?? this.orderItemsId,
      orderItemsItemId: orderItemsItemId ?? this.orderItemsItemId,
      orderItemsQuantity: orderItemsQuantity ?? this.orderItemsQuantity,
      orderItemsOrderId: orderItemsOrderId ?? this.orderItemsOrderId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (orderItemsId.present) {
      map['order_items_id'] = Variable<int>(orderItemsId.value);
    }
    if (orderItemsItemId.present) {
      map['order_items_item_id'] = Variable<int>(orderItemsItemId.value);
    }
    if (orderItemsQuantity.present) {
      map['order_items_quantity'] = Variable<int>(orderItemsQuantity.value);
    }
    if (orderItemsOrderId.present) {
      map['order_items_order_id'] = Variable<int>(orderItemsOrderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemsTableCompanion(')
          ..write('orderItemsId: $orderItemsId, ')
          ..write('orderItemsItemId: $orderItemsItemId, ')
          ..write('orderItemsQuantity: $orderItemsQuantity, ')
          ..write('orderItemsOrderId: $orderItemsOrderId')
          ..write(')'))
        .toString();
  }
}

class OrdersTable extends Table with TableInfo<OrdersTable, OrdersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _orderPriceMeta =
      const VerificationMeta('orderPrice');
  late final GeneratedColumn<double> orderPrice = GeneratedColumn<double>(
      'order_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _orderDeliveryMeta =
      const VerificationMeta('orderDelivery');
  late final GeneratedColumn<double> orderDelivery = GeneratedColumn<double>(
      'order_delivery', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [orderId, orderPrice, orderDelivery];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders_table';
  @override
  VerificationContext validateIntegrity(Insertable<OrdersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    }
    if (data.containsKey('order_price')) {
      context.handle(
          _orderPriceMeta,
          orderPrice.isAcceptableOrUnknown(
              data['order_price']!, _orderPriceMeta));
    } else if (isInserting) {
      context.missing(_orderPriceMeta);
    }
    if (data.containsKey('order_delivery')) {
      context.handle(
          _orderDeliveryMeta,
          orderDelivery.isAcceptableOrUnknown(
              data['order_delivery']!, _orderDeliveryMeta));
    } else if (isInserting) {
      context.missing(_orderDeliveryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {orderId};
  @override
  OrdersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdersTableData(
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id']),
      orderPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order_price'])!,
      orderDelivery: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}order_delivery'])!,
    );
  }

  @override
  OrdersTable createAlias(String alias) {
    return OrdersTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class OrdersTableData extends DataClass implements Insertable<OrdersTableData> {
  final int? orderId;
  final double orderPrice;
  final double orderDelivery;
  const OrdersTableData(
      {this.orderId, required this.orderPrice, required this.orderDelivery});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<int>(orderId);
    }
    map['order_price'] = Variable<double>(orderPrice);
    map['order_delivery'] = Variable<double>(orderDelivery);
    return map;
  }

  OrdersTableCompanion toCompanion(bool nullToAbsent) {
    return OrdersTableCompanion(
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      orderPrice: Value(orderPrice),
      orderDelivery: Value(orderDelivery),
    );
  }

  factory OrdersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdersTableData(
      orderId: serializer.fromJson<int?>(json['order_id']),
      orderPrice: serializer.fromJson<double>(json['order_price']),
      orderDelivery: serializer.fromJson<double>(json['order_delivery']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'order_id': serializer.toJson<int?>(orderId),
      'order_price': serializer.toJson<double>(orderPrice),
      'order_delivery': serializer.toJson<double>(orderDelivery),
    };
  }

  OrdersTableData copyWith(
          {Value<int?> orderId = const Value.absent(),
          double? orderPrice,
          double? orderDelivery}) =>
      OrdersTableData(
        orderId: orderId.present ? orderId.value : this.orderId,
        orderPrice: orderPrice ?? this.orderPrice,
        orderDelivery: orderDelivery ?? this.orderDelivery,
      );
  @override
  String toString() {
    return (StringBuffer('OrdersTableData(')
          ..write('orderId: $orderId, ')
          ..write('orderPrice: $orderPrice, ')
          ..write('orderDelivery: $orderDelivery')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(orderId, orderPrice, orderDelivery);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdersTableData &&
          other.orderId == this.orderId &&
          other.orderPrice == this.orderPrice &&
          other.orderDelivery == this.orderDelivery);
}

class OrdersTableCompanion extends UpdateCompanion<OrdersTableData> {
  final Value<int?> orderId;
  final Value<double> orderPrice;
  final Value<double> orderDelivery;
  const OrdersTableCompanion({
    this.orderId = const Value.absent(),
    this.orderPrice = const Value.absent(),
    this.orderDelivery = const Value.absent(),
  });
  OrdersTableCompanion.insert({
    this.orderId = const Value.absent(),
    required double orderPrice,
    required double orderDelivery,
  })  : orderPrice = Value(orderPrice),
        orderDelivery = Value(orderDelivery);
  static Insertable<OrdersTableData> custom({
    Expression<int>? orderId,
    Expression<double>? orderPrice,
    Expression<double>? orderDelivery,
  }) {
    return RawValuesInsertable({
      if (orderId != null) 'order_id': orderId,
      if (orderPrice != null) 'order_price': orderPrice,
      if (orderDelivery != null) 'order_delivery': orderDelivery,
    });
  }

  OrdersTableCompanion copyWith(
      {Value<int?>? orderId,
      Value<double>? orderPrice,
      Value<double>? orderDelivery}) {
    return OrdersTableCompanion(
      orderId: orderId ?? this.orderId,
      orderPrice: orderPrice ?? this.orderPrice,
      orderDelivery: orderDelivery ?? this.orderDelivery,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (orderPrice.present) {
      map['order_price'] = Variable<double>(orderPrice.value);
    }
    if (orderDelivery.present) {
      map['order_delivery'] = Variable<double>(orderDelivery.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableCompanion(')
          ..write('orderId: $orderId, ')
          ..write('orderPrice: $orderPrice, ')
          ..write('orderDelivery: $orderDelivery')
          ..write(')'))
        .toString();
  }
}

class ItemsTable extends Table with TableInfo<ItemsTable, ItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _itemTitleMeta =
      const VerificationMeta('itemTitle');
  late final GeneratedColumn<String> itemTitle = GeneratedColumn<String>(
      'item_title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _itemPriceMeta =
      const VerificationMeta('itemPrice');
  late final GeneratedColumn<double> itemPrice = GeneratedColumn<double>(
      'item_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [itemId, itemTitle, itemPrice, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items_table';
  @override
  VerificationContext validateIntegrity(Insertable<ItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    }
    if (data.containsKey('item_title')) {
      context.handle(_itemTitleMeta,
          itemTitle.isAcceptableOrUnknown(data['item_title']!, _itemTitleMeta));
    } else if (isInserting) {
      context.missing(_itemTitleMeta);
    }
    if (data.containsKey('item_price')) {
      context.handle(_itemPriceMeta,
          itemPrice.isAcceptableOrUnknown(data['item_price']!, _itemPriceMeta));
    } else if (isInserting) {
      context.missing(_itemPriceMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  ItemsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemsTableData(
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      itemTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_title'])!,
      itemPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}item_price'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
    );
  }

  @override
  ItemsTable createAlias(String alias) {
    return ItemsTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ItemsTableData extends DataClass implements Insertable<ItemsTableData> {
  final int itemId;
  final String itemTitle;
  final double itemPrice;
  final int categoryId;
  const ItemsTableData(
      {required this.itemId,
      required this.itemTitle,
      required this.itemPrice,
      required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<int>(itemId);
    map['item_title'] = Variable<String>(itemTitle);
    map['item_price'] = Variable<double>(itemPrice);
    map['category_id'] = Variable<int>(categoryId);
    return map;
  }

  ItemsTableCompanion toCompanion(bool nullToAbsent) {
    return ItemsTableCompanion(
      itemId: Value(itemId),
      itemTitle: Value(itemTitle),
      itemPrice: Value(itemPrice),
      categoryId: Value(categoryId),
    );
  }

  factory ItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemsTableData(
      itemId: serializer.fromJson<int>(json['item_id']),
      itemTitle: serializer.fromJson<String>(json['item_title']),
      itemPrice: serializer.fromJson<double>(json['item_price']),
      categoryId: serializer.fromJson<int>(json['category_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'item_id': serializer.toJson<int>(itemId),
      'item_title': serializer.toJson<String>(itemTitle),
      'item_price': serializer.toJson<double>(itemPrice),
      'category_id': serializer.toJson<int>(categoryId),
    };
  }

  ItemsTableData copyWith(
          {int? itemId,
          String? itemTitle,
          double? itemPrice,
          int? categoryId}) =>
      ItemsTableData(
        itemId: itemId ?? this.itemId,
        itemTitle: itemTitle ?? this.itemTitle,
        itemPrice: itemPrice ?? this.itemPrice,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('ItemsTableData(')
          ..write('itemId: $itemId, ')
          ..write('itemTitle: $itemTitle, ')
          ..write('itemPrice: $itemPrice, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, itemTitle, itemPrice, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemsTableData &&
          other.itemId == this.itemId &&
          other.itemTitle == this.itemTitle &&
          other.itemPrice == this.itemPrice &&
          other.categoryId == this.categoryId);
}

class ItemsTableCompanion extends UpdateCompanion<ItemsTableData> {
  final Value<int> itemId;
  final Value<String> itemTitle;
  final Value<double> itemPrice;
  final Value<int> categoryId;
  const ItemsTableCompanion({
    this.itemId = const Value.absent(),
    this.itemTitle = const Value.absent(),
    this.itemPrice = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  ItemsTableCompanion.insert({
    this.itemId = const Value.absent(),
    required String itemTitle,
    required double itemPrice,
    required int categoryId,
  })  : itemTitle = Value(itemTitle),
        itemPrice = Value(itemPrice),
        categoryId = Value(categoryId);
  static Insertable<ItemsTableData> custom({
    Expression<int>? itemId,
    Expression<String>? itemTitle,
    Expression<double>? itemPrice,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (itemTitle != null) 'item_title': itemTitle,
      if (itemPrice != null) 'item_price': itemPrice,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  ItemsTableCompanion copyWith(
      {Value<int>? itemId,
      Value<String>? itemTitle,
      Value<double>? itemPrice,
      Value<int>? categoryId}) {
    return ItemsTableCompanion(
      itemId: itemId ?? this.itemId,
      itemTitle: itemTitle ?? this.itemTitle,
      itemPrice: itemPrice ?? this.itemPrice,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (itemTitle.present) {
      map['item_title'] = Variable<String>(itemTitle.value);
    }
    if (itemPrice.present) {
      map['item_price'] = Variable<double>(itemPrice.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsTableCompanion(')
          ..write('itemId: $itemId, ')
          ..write('itemTitle: $itemTitle, ')
          ..write('itemPrice: $itemPrice, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class CategoriesTable extends Table
    with TableInfo<CategoriesTable, CategoriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _categoryTitleMeta =
      const VerificationMeta('categoryTitle');
  late final GeneratedColumn<String> categoryTitle = GeneratedColumn<String>(
      'category_title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [categoryId, categoryTitle];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('category_title')) {
      context.handle(
          _categoryTitleMeta,
          categoryTitle.isAcceptableOrUnknown(
              data['category_title']!, _categoryTitleMeta));
    } else if (isInserting) {
      context.missing(_categoryTitleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId};
  @override
  CategoriesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesTableData(
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      categoryTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_title'])!,
    );
  }

  @override
  CategoriesTable createAlias(String alias) {
    return CategoriesTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CategoriesTableData extends DataClass
    implements Insertable<CategoriesTableData> {
  final int categoryId;
  final String categoryTitle;
  const CategoriesTableData(
      {required this.categoryId, required this.categoryTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['category_title'] = Variable<String>(categoryTitle);
    return map;
  }

  CategoriesTableCompanion toCompanion(bool nullToAbsent) {
    return CategoriesTableCompanion(
      categoryId: Value(categoryId),
      categoryTitle: Value(categoryTitle),
    );
  }

  factory CategoriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesTableData(
      categoryId: serializer.fromJson<int>(json['category_id']),
      categoryTitle: serializer.fromJson<String>(json['category_title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'category_id': serializer.toJson<int>(categoryId),
      'category_title': serializer.toJson<String>(categoryTitle),
    };
  }

  CategoriesTableData copyWith({int? categoryId, String? categoryTitle}) =>
      CategoriesTableData(
        categoryId: categoryId ?? this.categoryId,
        categoryTitle: categoryTitle ?? this.categoryTitle,
      );
  @override
  String toString() {
    return (StringBuffer('CategoriesTableData(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryTitle: $categoryTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryId, categoryTitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesTableData &&
          other.categoryId == this.categoryId &&
          other.categoryTitle == this.categoryTitle);
}

class CategoriesTableCompanion extends UpdateCompanion<CategoriesTableData> {
  final Value<int> categoryId;
  final Value<String> categoryTitle;
  const CategoriesTableCompanion({
    this.categoryId = const Value.absent(),
    this.categoryTitle = const Value.absent(),
  });
  CategoriesTableCompanion.insert({
    this.categoryId = const Value.absent(),
    required String categoryTitle,
  }) : categoryTitle = Value(categoryTitle);
  static Insertable<CategoriesTableData> custom({
    Expression<int>? categoryId,
    Expression<String>? categoryTitle,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (categoryTitle != null) 'category_title': categoryTitle,
    });
  }

  CategoriesTableCompanion copyWith(
      {Value<int>? categoryId, Value<String>? categoryTitle}) {
    return CategoriesTableCompanion(
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryTitle.present) {
      map['category_title'] = Variable<String>(categoryTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesTableCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryTitle: $categoryTitle')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabaseClient extends GeneratedDatabase {
  _$LocalDatabaseClient(QueryExecutor e) : super(e);
  late final OrderItemsTable orderItemsTable = OrderItemsTable(this);
  late final OrdersTable ordersTable = OrdersTable(this);
  late final ItemsTable itemsTable = ItemsTable(this);
  late final CategoriesTable categoriesTable = CategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [orderItemsTable, ordersTable, itemsTable, categoriesTable];
}
