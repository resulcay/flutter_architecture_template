import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MobileViewAdapter extends StatelessWidget {
  const MobileViewAdapter({
    required this.phone,
    required this.tablet,
    super.key,
  });

  final Widget phone;
  final Widget tablet;
  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;

    return tablet;
  }
}
