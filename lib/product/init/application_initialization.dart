import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:pureblog/product/init/config/app_environment.dart';
import 'package:pureblog/product/init/network/custom_http_overrides.dart';
import 'package:pureblog/product/state/container/product_state_container.dart';

@immutable
final class ApplicationInitialization {
  Future<void> initConfig() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  Future<void> _initialize() async {
    HttpOverrides.global = CustomHttpOverrides();

    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };

    AppEnvironment.setEnvironment();
    ProductContainer.setup();
  }
}
