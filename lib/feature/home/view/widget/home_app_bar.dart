part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      title: Assets.images.logo.image(
        package: 'gen',
        height: 26,
      ),
      actions: const [
        _TrailingWidget(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TrailingWidget extends StatelessWidget {
  const _TrailingWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeViewState>(
      builder: (context, state) {
        if (!state.isLoading) return const SizedBox.shrink();
        return CircularProgressIndicator.adaptive();
      },
    );
  }
}
