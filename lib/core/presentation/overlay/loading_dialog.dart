import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:injectable/injectable.dart';

abstract class LoadingDialog {
  void hideLoading();


  void showLoading();
  static LoadingDialog get instance => LoadingDialogViewContractImpl();
}

mixin class LoadingDialogViewContractImpl implements LoadingDialog {

  @override
  void hideLoading() {
    SmartDialog.dismiss();
  }

  @override
  void showLoading() {
    SmartDialog.showLoading(
      msg: 'Loading',
      backDismiss: false,
      useAnimation: true,
    );
    // overrideverlayKey.currentState?.insert(loadingOverlay);
  }
}
