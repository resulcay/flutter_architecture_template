import 'package:flutter/material.dart';
import 'package:widget/src/core/dialog_base.dart';

final class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.title,
    super.key,
  });
  final String title;
  static Future<bool> show({
    required BuildContext context,
    required String title,
  }) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => SuccessDialog(title: title),
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.check_circle),
        ),
      ],
    );
  }
}
