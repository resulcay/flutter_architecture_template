import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

final class CustomResponsiveBuilder {
  static Widget build(BuildContext context, Widget? child) {
    return ResponsiveBreakpoints.builder(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: child!,
    );
  }
}
