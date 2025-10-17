import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/app_colors.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Cats', 'Dogs', 'Birds', 'Fish', 'Reptiles'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: GestureDetector(
                  onTap: () => isSelected!=isSelected,
                  child: Container(
                    height: 35.h,
                    width: 56.w,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16.r),
                      ),
                      color: isSelected
                          ? AppColors.petTabBar
                          : AppColors.searchFieldBackground,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
