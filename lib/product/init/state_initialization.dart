import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureblog/product/state/container/product_state_items.dart';
import 'package:pureblog/product/state/view_model/product_view_model.dart';

final class StateInitialization extends StatelessWidget {
  const StateInitialization({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        ),
      ],
      child: child,
    );
  }
}
