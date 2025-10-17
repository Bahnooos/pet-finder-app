import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetImageHeader extends StatelessWidget {
  final String imageUrl;

  const PetImageHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topCenter,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          height: 400.h,
          fit: BoxFit.values[2],
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Positioned(
          top: 20.h,
          left: 20.w,
          right: 20.w,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Color(0xFF37BAA6),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
