import 'package:cashier/app/domain/entities/category.dart';
import 'package:cashier/app/domain/repositories/categories_repo.dart';
import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/application/view_model/riverpod_base_controller.dart';
import 'package:cashier/core/presentation/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import 'categories_view_model.dart';

class CategoriesState {
  final CustomState<List<Category>> categoriesState;
  List<Category> get categories =>
      (categoriesState as CustomLoadedState<List<Category>>).data!;

  const CategoriesState({
    required this.categoriesState,
  });

  CategoriesState copyWith({
    CustomState<List<Category>>? categoriesState,
  }) {
    return CategoriesState(
      categoriesState: categoriesState ?? this.categoriesState,
    );
  }

  factory CategoriesState.initial() {
    return CategoriesState(
      categoriesState: CustomState.initial(),
    );
  }
}

final categoriesViewModelProvider =
    StateNotifierProvider.autoDispose<CategoriesViewModel, CategoriesState>(
  (
    ref,
  ) =>
      getIt<CategoriesViewModel>()..getAll(),
);

abstract class CategoriesViewContract extends ViewContract {}

@Injectable()
class CategoriesViewModel
    extends AppViewModel<CategoriesState, CategoriesViewContract> {
  CategoriesViewModel(
    this.repo,
  ) : super(CategoriesState.initial());
  final CategoriesRepo repo;

  Future<void> getAll() async {
    state = state.copyWith(categoriesState: const CustomState.loading());
    repo.getAll().then((value) => value.fold(
          (l) => state = state.copyWith(categoriesState: CustomState.error(l)),
          (r) => state = state.copyWith(categoriesState: CustomState.loaded(r)),
        ));
  }

  Future<void> add(CategoryData category) async {
    repo.add(category).then((value) => value.fold(
          (l) => null,
          (r) {
            state = state.copyWith(
                categoriesState: CustomLoadedState(
              [...state.categories, r],
            ));
          },
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
