import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/app_text_styles.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';
import 'package:pet_finder_app/features/home/presentation/logic/cubit/home_cubit.dart';

class PetCard extends StatelessWidget {
  final PetModels petModels;
  final bool isFavorite;
  const PetCard({super.key, required this.petModels, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: petModels.image?.url ?? '',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        petModels.name?.split(' ').first ?? '',
                        style: AppTextStyles.font18BlackBold,
                        maxLines: 2,
                      ),
                      Spacer(),

                      GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().toggleFavorite(
                                petId: petModels.image?.id ?? '',
                              );
                        },
                        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.redAccent : Colors.grey,),
                      ),
                      
                    ],
                  ),
                  Text(
                    petModels.origin ?? '',
                    style: AppTextStyles.font14DarkGrayGrayRegular,
                  ),
                  Text(
                    petModels.id ?? '',
                    style: AppTextStyles.font14DarkGrayGrayRegular,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
