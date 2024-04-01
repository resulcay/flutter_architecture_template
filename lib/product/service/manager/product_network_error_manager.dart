import 'dart:io';

import 'package:flutter/widgets.dart';

final class ProductNetworkErrorManager {
  ProductNetworkErrorManager({required this.context});

  final BuildContext context;

  void handleError(int value) {
    if (value == HttpStatus.unauthorized) {
      // Navigator.of(context).pushNamedAndRemoveUntil(
    }
  }
}
