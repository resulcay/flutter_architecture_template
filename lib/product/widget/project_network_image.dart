import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({required this.imageUrl, super.key});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: imageUrl,
      size: Size(100, 200),
      loading: Assets.lottie.imageIndicator.lottie(package: 'gen'),
    );
  }
}
