// ignore: depend_on_referenced_packages
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pureblog/product/init/application_initialization.dart';
import 'package:pureblog/product/init/language/product_localization.dart';
import 'package:pureblog/product/init/theme/custom_dark_theme.dart';
import 'package:pureblog/product/init/theme/custom_light_theme.dart';
import 'package:pureblog/product/navigation/app_router.dart';
import 'package:widget/widget.dart';

void main() async {
  await ApplicationInitialization().initConfig();
  runApp(
    DevicePreview(
      builder: (BuildContext context) => ProductLocalization(child: _MyApp()),
    ),
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp();
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsiveBuilder.build,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'PureBlog',
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
    );
  }
}
