import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetAttributeCard extends StatelessWidget {
  final String title;
  final String value;

  const PetAttributeCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
