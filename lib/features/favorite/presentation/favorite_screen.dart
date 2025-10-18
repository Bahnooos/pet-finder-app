import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/favorite/presentation/logic/cubit/favorite_cubit.dart';

import 'logic/cubit/favorite_state.dart';
import 'widgets/favorite_pet_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Your Favorite Pets',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  buildWhen: (previous, current) =>
                      current is FavoriteLoadingState ||
                      current is FavoriteSuccessState ||
                      current is FavoriteErrorState,
                  builder: (context, state) {
                    switch (state) {
                      case FavoriteLoadingState():
                        CircularProgressIndicator();
                      case FavoriteSuccessState(data: final data):
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,

                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 12.h,
                              ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return FavoritePetCard(favoriteItem: data[index]);
                          },
                        );

                      case FavoriteErrorState(errorMessage: final errorMessage):
                        return Center(
                          child: Text(errorMessage ?? 'An error occurred.'),
                        );

                      default:
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
