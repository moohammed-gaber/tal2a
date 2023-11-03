import 'package:cashier/core/application/view_model/app_state.dart';
import 'package:flutter/material.dart';
class Retry extends StatelessWidget {
  const Retry({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: onTap,
      child: Text('Retry'),
    ));
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Empty'),
    );
  }
}

class StateHandler<T extends Object> extends StatelessWidget {
  const StateHandler(
      {super.key,
      required this.onTapRetry,
      required this.customState,
      required this.onData});

  final VoidCallback onTapRetry;
  final CustomState<T> customState;
  final Widget Function(T? data) onData;
  @override
  Widget build(BuildContext context) {
    return switch (customState) {
      CustomLoadedState(data: final T? data) => onData(data),
      CustomErrorState() => Retry(onTap: onTapRetry),
      CustomEmptyState() => Empty(),
      _ => const Progress()
    };
  }
}
