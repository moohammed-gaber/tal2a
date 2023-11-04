import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/order.dart';
import 'package:cashier/app/domain/repositories/categories_repo.dart';
import 'package:cashier/app/domain/repositories/orders_repo.dart';
import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/application/view_model/riverpod_base_controller.dart';
import 'package:cashier/core/presentation/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import 'categories_view_model.dart';

class OrdersState {
  final CustomState<List<OrderEntity>> ordersState;
  List<OrderEntity> get categories =>
      (ordersState as CustomLoadedState<List<OrderEntity>>).data!;

  const OrdersState({
    required this.ordersState,
  });

  OrdersState copyWith({
    CustomState<List<OrderEntity>>? categoriesState,
  }) {
    return OrdersState(
      ordersState: categoriesState ?? this.ordersState,
    );
  }

  factory OrdersState.initial() {
    return OrdersState(
      ordersState: CustomState.initial(),
    );
  }
}

final ordersViewModelProvider =
    StateNotifierProvider.autoDispose<OrdersViewModel, OrdersState>(
  (
    ref,
  ) =>
      getIt<OrdersViewModel>()..getAll(),
);

abstract class OrdersViewContract extends ViewContract {}

@Injectable()
class OrdersViewModel extends AppViewModel<OrdersState, OrdersViewContract> {
  OrdersViewModel(
    this.repo,
  ) : super(OrdersState.initial());
  final OrdersRepo repo;

  Future<void> getAll() async {
    state = state.copyWith(categoriesState: const CustomState.loading());
    repo.getAll().then((value) => value.fold(
          (l) => state = state.copyWith(categoriesState: CustomState.error(l)),
          (r) => state = state.copyWith(categoriesState: CustomState.loaded(r)),
        ));
  }

  Future<void> delete(int index) async {
    await repo.delete(state.categories[index].id);
    state = state.copyWith(
        categoriesState: CustomLoadedState(
      [...state.categories..removeAt(index)],
    ));
  }
}
