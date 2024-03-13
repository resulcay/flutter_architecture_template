import 'package:flutter/foundation.dart';
import 'package:pureblog/product/init/config/app_config.dart';
import 'package:pureblog/product/init/config/env_dev.dart';
import 'package:pureblog/product/init/config/env_prod.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfig config}) {
    _config = config;
  }

  AppEnvironment.setEnvironment() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }

  static late final AppConfig _config;
}

enum EnvironmentItems {
  baseUrl,
  apiKey;

  String get value {
    try {
      switch (this) {
        case EnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case EnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (_) {
      throw Exception('Environment item not found');
    }
  }
}
