import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/repositories/Items_repo.dart';
import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/application/view_model/riverpod_base_controller.dart';
import 'package:cashier/core/presentation/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import 'items_view_model.dart';

class ItemsState {
  final CustomState<List<Item>> itemsState;
  List<Item> get items => (itemsState as CustomLoadedState<List<Item>>).data!;

  const ItemsState({
    required this.itemsState,
  });

  ItemsState copyWith({
    CustomState<List<Item>>? itemsState,
  }) {
    return ItemsState(
      itemsState: itemsState ?? this.itemsState,
    );
  }

  factory ItemsState.initial() {
    return ItemsState(
      itemsState: CustomState.initial(),
    );
  }
}

final itemsViewModelProvider =
    StateNotifierProvider.autoDispose<ItemsViewModel, ItemsState>(
  (
    ref,
  ) =>
      getIt<ItemsViewModel>()..getAll(),
);

abstract class ItemsViewContract extends ViewContract {}

@Injectable()
class ItemsViewModel extends AppViewModel<ItemsState, ItemsViewContract> {
  ItemsViewModel(
    this.repo,
  ) : super(ItemsState.initial());
  final ItemsRepo repo;

  Future<void> getAll() async {
    state = state.copyWith(itemsState: const CustomState.loading());
    repo.getAll().then((value) => value.fold(
          (l) => state = state.copyWith(itemsState: CustomState.error(l)),
          (r) => state = state.copyWith(itemsState: CustomState.loaded(r)),
        ));
  }

  Future<void> add(ItemData items) async {
    repo.add(items).then((value) => value.fold(
          (l) => null,
          (r) {
            state = state.copyWith(
                itemsState: CustomLoadedState(
              [...state.items, r],
            ));
          },
        ));
  }

  Future<void> delete(int index) async {
    await repo.delete(state.items[index].id);
    state = state.copyWith(
        itemsState: CustomLoadedState(
      [...state.items..removeAt(index)],
    ));
  }
}
