import 'package:cashier/core/domain/failures/failure.dart';

sealed class CustomState<T extends Object> {
  const CustomState();
  const factory CustomState.loading() = CustomLoadingState;
  factory CustomState.loaded(T data) = CustomLoadedState<T>;
  const factory CustomState.error(Failure err) = CustomErrorState;
  const factory CustomState.empty() = CustomEmptyState;
  const factory CustomState.initial() = CustomInitialState;
}

class CustomEmptyState<T extends Object> extends CustomState<T> {
  const CustomEmptyState();
}

class CustomInitialState<T extends Object> extends CustomState<T> {
  const CustomInitialState();
}

class CustomLoadingState<T extends Object> extends CustomState<T> {
  const CustomLoadingState();
}

class CustomLoadedState<T extends Object> extends CustomState<T> {
  final T? data;
  const CustomLoadedState([this.data]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomLoadedState &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => data.hashCode;
}

class CustomErrorState<T extends Object> extends CustomState<T> {
  final Failure err;

  const CustomErrorState(this.err);
}
