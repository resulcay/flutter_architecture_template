import 'package:flutter/material.dart';
import 'package:widget/src/core/dialog_base.dart';

final class QuestionResponse {
  QuestionResponse({required this.response});

  final String response;
}

final class QuestionDialog extends StatefulWidget {
  const QuestionDialog({
    required this.title,
    super.key,
  });
  final String title;
  static Future<QuestionResponse?> show({
    required BuildContext context,
    required String title,
  }) {
    return DialogBase.show<QuestionResponse>(
      context: context,
      builder: (context) => QuestionDialog(title: title),
    );
  }

  @override
  State<QuestionDialog> createState() => _QuestionDialogState();
}

class _QuestionDialogState extends State<QuestionDialog> {
  String _response = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(widget.title),
      content: TextField(
        onChanged: (value) => _response = value,
      ),
      actions: [
        IconButton(
          onPressed: () {
            if (_response.isNotEmpty) Navigator.of(context).pop(null);
            Navigator.of(context).pop(QuestionResponse(response: _response));
          },
          icon: const Icon(Icons.check_circle),
        ),
      ],
    );
  }
}
