import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

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
                padding: EdgeInsets.only(right: 10.w),
                child: FilterChip(
                  selected: index == 0,
                  label: Text(categories[index]),
                  onSelected: (bool selected) {},
                  backgroundColor: Colors.grey[100],
                  selectedColor: const Color(0xFF37BAA6),
                  labelStyle: TextStyle(
                    color: index == 0 ? Colors.white : Colors.black,
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
