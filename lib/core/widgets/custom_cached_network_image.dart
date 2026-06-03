import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//////////  External  Pacage for ImageURL
class CustomCachedNetworkImage extends StatelessWidget {
  final String imageURL;
  final double? width;
  final double? height;

  const CustomCachedNetworkImage({super.key, required this.imageURL, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 122,
      height: width ?? 70,
      imageUrl: imageURL,
      fit: BoxFit.fill,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(width: width ?? 122, height: width ?? 70, color: Colors.white),
      ),
      errorWidget: (context, url, error) => Container(width: width ?? 122, height: height ?? 70, color: Colors.grey),
    );
  }
}
