import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetInfoCard extends StatelessWidget {
  final String name;
  final String price;
  final String distance;

  const PetInfoCard({
    super.key,
    required this.name,
    required this.price,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red, size: 16),
                  SizedBox(width: 4.w),
                  Text(
                    distance,
                    style: TextStyle(color: Colors.grey[600], fontSize: 16.sp),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF37BAA6),
            ),
          ),
        ],
      ),
    );
  }
}
