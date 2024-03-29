part of 'await_button.dart';

mixin _AwaitButtonMixin on MountedMixin<AwaitButton>, State<AwaitButton> {
  late final ValueNotifier<bool> _isLoadingNotifier;

  @override
  void initState() {
    super.initState();
    _isLoadingNotifier = ValueNotifier<bool>(false);
  }

  Future<void> _onPressed() async {
    _isLoadingNotifier.value = true;
    final response = await widget.onOperation.call();

    await safeAction(() async {
      if (response) Navigator.of(context).pop();
      _isLoadingNotifier.value = false;
    });
  }
}
