import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/extensions.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/core/theme/app_colors.dart';
import 'package:pet_finder_app/core/theme/app_text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage('assets/images/pet.png'),
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(32),
              Text(
                'Find Your Best\nCompanion With Us',
                style: AppTextStyles.font32BlackBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              Text(
                'Join & discover the best suitable pets as\nper your preferences in your location',
                style: AppTextStyles.font16LightGrayRegular,
                textAlign: TextAlign.center,
              ),
              verticalSpace(32),
              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () {
                    context.pushReplacementNamed(Routes.homeScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackGround,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.pets, color: Colors.white),
                      horizontalSpace(8),
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
