import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Widget for displaying an image loaded from a URL.
class NetworkImageView extends StatelessWidget {
  /// URL of the image to load.
  final String imageUrl;

  /// BoxFit property for image fitting.
  final BoxFit fit;

  /// Optional width of the image.
  final double? width;

  /// Optional height of the image.
  final double? height;

  const NetworkImageView(
    this.imageUrl, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      /// Load the image from the URL.
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 200,
        width: 200,
      ),
      errorWidget: (context, url, error) {
        /// Widget to display when there's an error loading the image.
        return SizedBox(
          height: height ?? 200,
          width: width ?? 200,
        );
      },
    );
  }
}
