import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pureblog/feature/home/view/home_view.dart';
import 'package:pureblog/product/init/application_initialization.dart';
import 'package:pureblog/product/init/language/product_localization.dart';
import 'package:pureblog/product/init/theme/custom_dark_theme.dart';

void main() async {
  await ApplicationInitialization().initConfig();
  runApp(ProductLocalization(child: const _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'PureBlog',
      theme: CustomDarkTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      home: const HomeView(),
    );
  }
}
