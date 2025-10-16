import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'widgets/categories_section.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/home_header.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/pet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pets = [
      {
        'name': 'Joli',
        'image': 'assets/images/cat.png',
        'gender': 'Female',
        'age': '5 Months Old',
        'distance': '1.6 km away',
      },
      // Add more pets...
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const HomeSearchBar(),
              const CategoriesSection(),
              Expanded(
                child: ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (context, index) => PetCard(pet: pets[index]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
