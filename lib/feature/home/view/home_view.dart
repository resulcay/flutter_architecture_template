import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/feature/home/view/mixin/await_button/await_button.dart';
import 'package:pureblog/feature/home/view/mixin/home_view_mixin.dart';
import 'package:pureblog/feature/home/view_model/home_view_model.dart';
import 'package:pureblog/feature/home/view_model/state/home_view_state.dart';
import 'package:pureblog/product/init/config/app_environment.dart';
import 'package:pureblog/product/init/language/locale_keys.g.dart';
import 'package:pureblog/product/init/language/product_localization.dart';
import 'package:pureblog/product/navigation/app_router.dart';
import 'package:pureblog/product/padding/custom_padding.dart';
import 'package:pureblog/product/state/base/base_state.dart';
import 'package:pureblog/product/utility/constant/enum/locales.dart';
import 'package:pureblog/product/widget/elevated_text_button.dart';
import 'package:pureblog/product/widget/project_network_image.dart';
import 'package:widget/widget.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await SuccessDialog.show(
              title: 'Success Dialog',
              context: context,
            );
          },
          child: const Icon(Icons.star_border_purple500_rounded),
        ),
        appBar: const _HomeAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const CustomPadding.allMedium(),
            child: Center(
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      productViewModel.changeThemeMode(ThemeMode.dark);
                    },
                    icon: Icon(Icons.dark_mode),
                  ),
                  IconButton(
                    onPressed: () {
                      productViewModel.changeThemeMode(ThemeMode.light);
                    },
                    icon: Icon(Icons.light_mode),
                  ),
                  AwaitButton(
                    onOperation: () {
                      return Future.delayed(
                        const Duration(seconds: 2),
                        () => true,
                      );
                    },
                  ),
                  ElevatedTextButton(
                    onPressed: () {
                      // context.read<HomeViewModel>().changeLoading();
                      viewModel.changeLoading();
                    },
                    child: const Text('Change Loading'),
                  ),
                  Text(EnvironmentItems.baseUrl.value),
                  Text(
                    'Change Language',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const Text(LocaleKeys.home_title).tr(),
                  ElevatedButton(
                    onPressed: () => ProductLocalization.changeLanguage(
                      context: context,
                      value: Locales.tr,
                    ),
                    child: Column(
                      children: [
                        const Text(LocaleKeys.general_button_save).tr(
                          args: ['Test'],
                        ),
                        Text(context.locale.toString()),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Card(
                      child: Center(child: Text('Test')),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () async {
                      await viewModel.getBlogs();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 60,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async =>
                        context.router.push<bool?>(HomeDetailRoute(id: '3')),
                    child: const Text(
                      'Route to Detail Page',
                    ),
                  ),
                  ProjectNetworkImage(
                    imageUrl:
                        'https://media.istockphoto.com/id/1455925649/tr/foto%C4%9Fraf/inside-the-quantum-lab-wide-center-shot-v01.jpg?s=2048x2048&w=is&k=20&c=T0Szxnnlb6GnMyiRzuQHn7YgczVtLzFt87Jg8HqwrCA=',
                  ),
                  ViewAdapter(
                    phone: Text('Phone'),
                    tablet: Text('Tablet'),
                    desktop: Text('Desktop'),
                  ),
                  _BlogListBuilder(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BlogListBuilder extends StatelessWidget {
  const _BlogListBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeViewState>(
      listener: (context, state) {
        if (kDebugMode) print(state.isLoading);
      },
      child: BlocSelector<HomeViewModel, HomeViewState, List<Blog>?>(
        selector: (state) => state.blogs ?? [],
        builder: (context, state) {
          if (state!.isEmpty) return const SizedBox.shrink();
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.length,
            itemBuilder: (context, index) {
              final blog = state[index];
              return ListTile(
                title: Text(
                  blog.blogTitle!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  blog.blogContent!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: ProjectNetworkImage(
                  imageUrl: 'https://pureblog.com.tr${blog.blogImage}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
