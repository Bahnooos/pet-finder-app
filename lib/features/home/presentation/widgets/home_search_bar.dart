import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app/core/helpers/svgs.dart';
import 'package:pet_finder_app/core/theme/app_colors.dart';
import 'package:pet_finder_app/core/theme/app_text_styles.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: SizedBox(
        height: 42.h,
        width: double.infinity,
        child: TextField(
          decoration: InputDecoration(
            hint: Row(
              children: [
                SvgPicture.asset(Svgs.searchIcon, width: 20.w, height: 20.h),
                4.horizontalSpace,
                Text('Search..', style: AppTextStyles.font16LightGrayRegular),
              ],
            ),
            suffixIcon: const Icon(Icons.tune, size: 20),
            filled: true,

            fillColor: AppColors.searchFieldBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
