import 'package:cashier/core/application/view_model/controllers.dart';
import 'package:cashier/core/domain/failures/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

abstract class ControllerLifeCycle {
  void onInit();

  void onClose();

  void onDidChangeDependencies();

  void onDidUpdateWidget();
}

abstract class AppLoadingViewContract<T>
    implements
        LoadingViewContract,
        SuccessViewContract<T>,
        FailedViewContract {}

abstract class AppLoadingStateNotifier<S, D,
    V extends AppLoadingViewContract<D>> extends AppViewModel<S, V> {
  AppLoadingStateNotifier(super.state);

  void showLoading() {
    return viewContract.showLoading();
  }

  void hideLoading() {
    return viewContract.hideLoading();
  }

  Future<D?> doWhileLoading(
    Future<D> Function() function,
  ) async {
    showLoading();
    try {
      final result = await function();
      viewContract.onSuccess(result);
      return result;
    } on Failure catch (e) {
      viewContract.onFailed(e);
    } catch (e) {
      viewContract.onFailed(UnExpectedFailure());
    } finally {
      hideLoading();
    }
    return null;
  }
}

abstract class AppViewModel<T, V extends ViewContract> extends StateNotifier<T>
    implements ControllerLifeCycle {
  AppViewModel(super.state) {
    onInit();
  }

  late V _viewContract;

  void attachViewContract(V viewContract) {
    this._viewContract = viewContract;
    // onInit();
  }

  V get viewContract => _viewContract;

  @override
  void dispose() {
    onClose();
    super.dispose();
  }

  @override
  void onClose() {
    debugPrint(
      '🌑 onClose called from $runtimeType, no need for continue listening to this observer anymore.',
    );
  }

  @override
  void onInit() {
    debugPrint('🌞 onInit called from $runtimeType');
  }

  @override
  void onDidChangeDependencies() {
    debugPrint(
      '🌗 onDidChangeDependencies called from $runtimeType. You are using stateful widget to keep track of state.',
    );
  }

  @override
  void onDidUpdateWidget() {
    debugPrint(
      '🌗 onDidChangeDependencies called from $runtimeType. You are using stateful widget to keep track of state.',
    );
  }
}

abstract class AppControllerState {}

class NoState extends AppControllerState {}

class StateLogger extends ProviderObserver {
  bool enable = false;

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (!enable) return;
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
  "previousValue": "$previousValue"
}''');
  }
}
