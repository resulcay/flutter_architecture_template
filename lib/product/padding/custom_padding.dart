import 'package:flutter/material.dart';

final class CustomPadding extends EdgeInsets {
  const CustomPadding.allSmall() : super.all(8);
  const CustomPadding.allMedium() : super.all(16);
  const CustomPadding.allLarge() : super.all(24);
  const CustomPadding.allExtraLarge() : super.all(32);
}
