import 'package:flutter/material.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  bool get isLoading => _isLoadingNotifier.value;
  ValueNotifier<bool> get isLoadingNotifier => _isLoadingNotifier;

  void switchLoading({bool? value}) {
    if (value != null) _isLoadingNotifier.value = value;

    _isLoadingNotifier.value = !_isLoadingNotifier.value;
  }
}
