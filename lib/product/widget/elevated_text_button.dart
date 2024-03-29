import 'package:flutter/material.dart';

final class ElevatedTextButton extends TextButton {
  ElevatedTextButton({
    required super.onPressed,
    required super.child,
    super.key,
  }) : super(style: TextButton.styleFrom(elevation: 20));
}
