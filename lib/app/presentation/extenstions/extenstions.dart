import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtenstions on BuildContext {
  Future<T?> to<T>(Widget page) => Navigator.of(this).push(MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ));
}
