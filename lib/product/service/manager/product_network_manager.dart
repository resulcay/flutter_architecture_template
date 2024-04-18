import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pureblog/product/init/config/app_environment.dart';
import 'package:vexana/vexana.dart';

final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: EnvironmentItems.baseUrl.value,
            connectTimeout: const Duration(seconds: 10),
          ),
        );

  void listenErrorStatus({required ValueChanged<int> errorListener}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          errorListener(error.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(error);
        },
      ),
    );
  }
}
