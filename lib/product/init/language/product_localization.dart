import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pureblog/product/utility/constant/enum/locales.dart';

@immutable
final class ProductLocalization extends EasyLocalization {
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _assetPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales =
      Locales.values.map((e) => e.locale).toList();

  static const String _assetPath = 'module/gen/assets/translations';

  static Future<void> changeLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
