import 'package:flutter/material.dart';

final class DialogBase {
  DialogBase._();
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
    );
  }
}
