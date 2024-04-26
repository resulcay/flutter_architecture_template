import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureblog/product/init/application_initialization.dart';
import 'package:pureblog/product/init/language/product_localization.dart';
import 'package:pureblog/product/init/state_initialization.dart';
import 'package:pureblog/product/init/theme/custom_dark_theme.dart';
import 'package:pureblog/product/init/theme/custom_light_theme.dart';
import 'package:pureblog/product/navigation/app_router.dart';
import 'package:pureblog/product/state/view_model/product_view_model.dart';
import 'package:widget/widget.dart';

Future<void> main() async {
  await ApplicationInitialization().initConfig();
  runApp(
    ProductLocalization(child: StateInitialization(child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      title: 'Flutter Architecture Template',
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
    );
  }
}
