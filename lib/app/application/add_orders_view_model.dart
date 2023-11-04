import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/repositories/Items_repo.dart';
import 'package:cashier/app/domain/repositories/orders_repo.dart';
import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/application/view_model/riverpod_base_controller.dart';
import 'package:cashier/core/infrastructure/device/device_printer.dart';
import 'package:cashier/core/presentation/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../domain/entities/order.dart';
import 'add_orders_view_model.dart';

class AddOrdersState {
  final List<OrderItem> selectedItems;

  const AddOrdersState({
    required this.selectedItems,
  });

  AddOrdersState copyWith({
    List<OrderItem>? selectedItems,
  }) {
    return AddOrdersState(
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }

  factory AddOrdersState.initial() {
    return AddOrdersState(
      selectedItems: [],
    );
  }
}

final addOrdersViewModelProvider =
    StateNotifierProvider.autoDispose<AddOrdersViewModel, AddOrdersState>(
  (
    ref,
  ) =>
      getIt<AddOrdersViewModel>()..getAll(),
);

abstract class OrdersViewContract extends ViewContract {}

@Injectable()
class AddOrdersViewModel extends AppViewModel<AddOrdersState, OrdersViewContract> {
  AddOrdersViewModel(
    this.repo,
    this._itemsRepo,
  ) : super(AddOrdersState.initial());
  final OrdersRepo repo;
  final ItemsRepo _itemsRepo;

  Future<void> getAll() async {}

  Future<void> delete(int index) async {
    // await repo.delete(state.orders[index].id);
  }
  Future<void> add(num deliveryPrice) async {
    final total = state.selectedItems.fold(
        0.0, (previousValue, element) => previousValue + element.totalPrice);
    getIt<DevicePrinter>().printReceipt(PrintArguments(
        deliveryPrice: deliveryPrice,
        totalPrice: total,
        items: state.selectedItems));
    await repo.add(OrderData(deliveryPrice: deliveryPrice, price: total),
        state.selectedItems);
  }

  void reset() {
    state = AddOrdersState.initial();
  }

  Future<List<Item>> getItem(String pattern) async {
    final result = await _itemsRepo.search(pattern);
    return result.fold((l) => [], (r) => r);
  }

  void onSelectItem(OrderItem suggestion) {
    final index = state.selectedItems
        .indexWhere((element) => element.item.id == suggestion.item.id);
    if (index == -1) {
      state =
          state.copyWith(selectedItems: [...state.selectedItems, suggestion]);
    } else {
      increaseQuantity(index);
    }
  }

  increaseQuantity(int i) {
    final newList = state.selectedItems;
    newList[i] = newList[i].copyWith(quantity: newList[i].quantity + 1);
    state = state.copyWith(selectedItems: newList);
  }

  decreaseQuantity(int i) {
    final newList = state.selectedItems;
    if (newList[i].quantity == 1) return;
    newList[i] = newList[i].copyWith(quantity: newList[i].quantity - 1);
    state = state.copyWith(selectedItems: newList);
  }
}
