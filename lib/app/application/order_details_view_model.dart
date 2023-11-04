import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/entities/order.dart';
import 'package:cashier/app/domain/repositories/categories_repo.dart';
import 'package:cashier/app/domain/repositories/orders_repo.dart';
import 'package:cashier/app/presentation/pages/order_details.dart';
import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/application/view_model/riverpod_base_controller.dart';
import 'package:cashier/core/presentation/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import 'categories_view_model.dart';

class OrderDetailsState {
  final CustomState<List<OrderItem>> ordersState;
  final OrderEntity orderEntity;
  List<OrderItem> get categories =>
      (ordersState as CustomLoadedState<List<OrderItem>>).data!;

  const OrderDetailsState({
    required this.ordersState,
    required this.orderEntity,
  });

  OrderDetailsState copyWith({
    CustomState<List<OrderItem>>? categoriesState,
    OrderEntity ?orderEntity
  }) {
    return OrderDetailsState(
      orderEntity: orderEntity??this.orderEntity,
      ordersState: categoriesState ?? this.ordersState,
    );
  }

  factory OrderDetailsState.initial(OrderEntity order) {
    return OrderDetailsState(orderEntity: order,
      ordersState: CustomState.initial(),
    );
  }
}

final ordersDetailsViewModelProvider = StateNotifierProvider.family.autoDispose<
    OrderDetailsViewModel, OrderDetailsState, OrderDetailsArguments>(
  (ref, arg) => getIt<OrderDetailsViewModel>(param1: arg)..getAll(),
);

abstract class OrderDetailsViewContract extends ViewContract {}

@Injectable()
class OrderDetailsViewModel
    extends AppViewModel<OrderDetailsState, OrderDetailsViewContract> {
  OrderDetailsViewModel(
      this.repo, @factoryParam OrderDetailsArguments arguments)
      : super(OrderDetailsState.initial(arguments.order));
  final OrdersRepo repo;

  Future<void> getAll() async {
    state = state.copyWith(categoriesState: const CustomState.loading());
    return repo.getOrderItems(state.orderEntity.id).then((value) => value.fold(
          (l) => state = state.copyWith(categoriesState: CustomState.error(l)),
          (r) => state = state.copyWith(categoriesState: CustomState.loaded(r)),
        ));
  }
}
