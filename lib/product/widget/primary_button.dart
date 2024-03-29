import 'package:flutter/material.dart';
import 'package:pureblog/product/utility/constant/enum/custom_radius.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: CustomRadius.medium.value,
      onTap: onPressed,
      child: Text(text),
    );
  }
}
