import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/data/models/pet_models.dart';
import 'widgets/adopt_button.dart';
import 'widgets/pet_attribute_card.dart';
import 'widgets/pet_image_header.dart';
import 'widgets/pet_info_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pet});
  final PetModels pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PetImageHeader(imageUrl: pet.image?.url ?? ''),
              PetInfoCard(
                name: pet.name ?? '',
                price: '95',
                distance: '2.7 km away',
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PetAttributeCard(
                        title: pet.name ?? '',
                        value: 'Male',
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: PetAttributeCard(
                        title: pet.origin ?? '',
                        value: '1 Year',
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: PetAttributeCard(title: 'Weight', value: '10 kg'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About:',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      pet.description?.split(',').toString() ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const AdoptButton(),
            ],
          ),
        ),
      ),
    );
  }
}
