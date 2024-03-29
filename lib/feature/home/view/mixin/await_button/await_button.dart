import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/product/widget/primary_button.dart';
import 'package:widget/widget.dart';

part 'await_button_mixin.dart';

final class AwaitButton extends StatefulWidget {
  const AwaitButton({
    required this.onOperation,
    super.key,
  });
  final AsyncValueGetter<bool> onOperation;
  @override
  State<AwaitButton> createState() => _AwaitButtonState();
}

class _AwaitButtonState extends State<AwaitButton>
    with MountedMixin, _AwaitButtonMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: _isLoadingNotifier,
          builder: (_, value, __) {
            if (value) return Assets.lottie.loading.lottie(package: 'gen');

            return PrimaryButton(
              text: 'Await Button',
              onPressed: _onPressed,
            );
          },
        ),
      ),
    );
  }
}
