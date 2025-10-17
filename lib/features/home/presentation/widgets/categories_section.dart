import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theme/app_colors.dart';
import 'package:pet_finder_app/core/theme/app_text_styles.dart';
import 'package:pet_finder_app/core/theme/font_weight_helper.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int selectedItem = 0;
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
          height: 30.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: GestureDetector(
                  onTap: () => setState(() => selectedItem = index),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20.r),
                      ),
                      color: selectedItem == index
                          ? AppColors.petTabBar
                          : AppColors.searchFieldBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: AppTextStyles.font16LightGrayRegular.copyWith(
                            fontWeight: FontWeightHelper.semiBold,
                            color: selectedItem == index
                                ? AppColors.white
                                : AppColors.darkGray,
                          ),
                        ),
                      ),
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
