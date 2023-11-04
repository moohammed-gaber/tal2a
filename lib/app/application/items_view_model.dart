import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/entities/item.dart';
import 'package:cashier/app/domain/repositories/Items_repo.dart';
import 'package:cashier/app/domain/repositories/categories_repo.dart';
import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/application/view_model/riverpod_base_controller.dart';
import 'package:cashier/core/presentation/injection/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import 'items_view_model.dart';

class ItemsState {
  final CustomState<List<Item>> itemsState;
  final Option<Category> selectedCategory;

  List<Item> get items => (itemsState as CustomLoadedState<List<Item>>).data!;

  const ItemsState({
    required this.itemsState,
    required this.selectedCategory,
  });

  ItemsState copyWith(
      {CustomState<List<Item>>? itemsState,
      Option<Category>? selectedCategory}) {
    return ItemsState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      itemsState: itemsState ?? this.itemsState,
    );
  }

  factory ItemsState.initial() {
    return ItemsState(
      selectedCategory: none(),
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
    this._categoriesRepo,
  ) : super(ItemsState.initial());
  final ItemsRepo repo;
  final CategoriesRepo _categoriesRepo;

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

  Future<List<Category>> getCategory(String search) async {
    final result = await _categoriesRepo.getAll();
    return result.fold((l) => [], (r) => r);
  }

  Future<void> delete(int index) async {
    await repo.delete(state.items[index].id);
    state = state.copyWith(
        itemsState: CustomLoadedState(
      [...state.items..removeAt(index)],
    ));
  }

  void onSelectCategory(Option<Category> suggestion) {
    state = state.copyWith(selectedCategory: suggestion);
  }
}
