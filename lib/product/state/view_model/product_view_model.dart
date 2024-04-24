import 'package:flutter/material.dart';
import 'package:pureblog/product/state/base/base_cubit.dart';
import 'package:pureblog/product/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
