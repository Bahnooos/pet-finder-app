import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/app_text_styles.dart';
import 'package:pet_finder_app/features/home/data/models/pet_models.dart';

class PetCard extends StatelessWidget {
  final PetModels petModels;
  const PetCard({super.key, required this.petModels});

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
              child: Image.asset(
                petModels.image?.url??'',
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        petModels.name??'',
                        style:AppTextStyles.font18BlackBold,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Color(0xFF37BAA6),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    petModels.origin??'',
                    style: AppTextStyles.font14DarkGrayGrayRegular,
                  ),
                  Text(petModels.id??'', style: AppTextStyles.font14DarkGrayGrayRegular,),
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
