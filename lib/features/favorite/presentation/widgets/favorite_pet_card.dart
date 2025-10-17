import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/networking/models/favorite_item.dart';

class FavoritePetCard extends StatelessWidget {
  final FavoriteItem favoriteItem;
  const FavoritePetCard({super.key, required this.favoriteItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: favoriteItem.image?.url ?? '',
              height: 130.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Positioned(
          //   top: 8,
          //   right: 8,
          //   child: IconButton(
          //     icon: const Icon(Icons.favorite, color: Color(0xFF37BAA6)),
          //     onPressed: () {},
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favoriteItem.imageId ?? '',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 16),
                    SizedBox(width: 4.w),
                    Text('1.7', style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
