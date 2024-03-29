import 'package:flutter/material.dart';
import 'package:pureblog/product/widget/primary_button.dart';
import 'package:widget/widget.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.onComplete,
    super.key,
  });

  final ValueChanged<bool> onComplete;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: 'Dialog Button',
      onPressed: () async {
        final answer = await SuccessDialog.show(
          context: context,
          title: 'Dialog Button',
        );

        onComplete.call(answer);
      },
    );
  }
}
