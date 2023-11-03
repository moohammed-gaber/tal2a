import 'package:cashier/core/domain/failures/failure.dart';
import 'package:cashier/core/presentation/overlay/loading_dialog.dart';

abstract class ViewContract {}

abstract class SuccessViewContract<S> extends ViewContract {
  void onSuccess(S s);
}

abstract class FormSubmittedViewContract extends ViewContract {
  void onFormSubmittedSuccess();
}

abstract class SuccessLoadingViewContract extends ViewContract {
  void onSuccess<T>(T value);
}

abstract class FailedViewContract extends ViewContract {
  void onFailed(Failure err);
}

abstract class SuccessMessageViewContract extends ViewContract {
  void showSuccessMessage();
}

abstract class LoadingViewContract extends ViewContract {
  void showLoading();

  void hideLoading();
}

abstract class ValidateViewContract<T> extends ViewContract {
  bool validate(T data);
}

abstract class ValidateNullableViewContract<T> extends ViewContract {
  bool validate(T? data);
}

class NoParams {}

mixin SuccessViewContractImpl implements SuccessMessageViewContract {
  @override
  void showSuccessMessage() {
    print('success');
/*
    CustomAlert.snackBar(
      context: GetReplacement.context,
      msg: S.current.success,
    );
*/
  }
}
mixin LoadingViewContractImpl implements LoadingViewContract {
  final loadingDialog = LoadingDialog.instance;
  @override
  void showLoading() {
    return loadingDialog.showLoading();
  }

  @override
  void hideLoading() {
    return loadingDialog.hideLoading();
  }
}
mixin FailedViewContractImpl {
  void onFailed(Failure err) {
    print('onFailed');

    // toast(err.toString());
    return;
  }
}

abstract class SuccessFailedViewContract<S> extends ViewContract {
  void onSuccess(S s);

  void onFailed(Failure e);
}

class NoViewContract extends ViewContract {}
