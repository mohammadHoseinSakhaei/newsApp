import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/widgets/shimmer.dart';

class ImageLoadingService extends StatelessWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const ImageLoadingService({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final Widget image = CachedNetworkImage(
      placeholder: (context, url) =>
          ShimmerBox(width: width ?? double.infinity, height: height ?? 156.h, borderRadius: borderRadius),
      errorWidget: (context, url, error) =>
          Image.asset('assets/img/no_image.png', width: double.infinity, height: 156.h, fit: BoxFit.cover),
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
    );
    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius ?? BorderRadius.zero, child: image);
    } else {
      return image;
    }
  }
}
