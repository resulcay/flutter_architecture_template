import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/feature/home/view/mixin/home_view_mixin.dart';
import 'package:pureblog/product/init/config/app_environment.dart';
import 'package:pureblog/product/init/language/locale_keys.g.dart';
import 'package:pureblog/product/init/language/product_localization.dart';
import 'package:pureblog/product/navigation/app_router.dart';
import 'package:pureblog/product/utility/constant/enum/locales.dart';
import 'package:pureblog/product/widget/project_network_image.dart';
import 'package:widget/widget.dart';

part 'widget/home_app_bar.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  size: 60,
                ),
              ),
              Assets.lottie.loading.lottie(
                height: 100,
                width: 100,
                package: 'gen',
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
            ],
          ),
        ),
      ),
    );
  }
}
