import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_mem_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.placeholder,
    this.loading,
    this.size,
    this.fit = BoxFit.cover,
    this.memCache = const CustomMemCache(
      width: 200,
      height: 200,
    ),
  });
  final String? imageUrl;
  final Widget? placeholder;
  final Widget? loading;
  final Size? size;
  final BoxFit fit;
  final CustomMemCache memCache;
  @override
  Widget build(BuildContext context) {
    final url = imageUrl;

    if (url == null || url.isEmpty) return placeholder ?? SizedBox.shrink();

    return CachedNetworkImage(
      imageUrl: url,
      memCacheWidth: memCache.width,
      memCacheHeight: memCache.height,
      fit: fit,
      height: size?.height,
      width: size?.width,
      errorWidget: (_, __, ___) => placeholder ?? SizedBox.shrink(),
      progressIndicatorBuilder: (_, __, ___) => SizedBox(
        height: size?.height,
        width: size?.width,
        child: Center(
          child: loading ?? Center(child: CircularProgressIndicator()),
        ),
      ),
      errorListener: (value) {
        if (kDebugMode) debugPrint('Error loading image: $value');
      },
    );
  }
}
