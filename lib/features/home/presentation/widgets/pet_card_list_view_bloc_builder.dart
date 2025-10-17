import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/helpers/extensions.dart';
import 'package:pet_finder_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:pet_finder_app/features/home/presentation/logic/cubit/home_state.dart';

import '../../../../core/routing/routes.dart';
import 'pet_card.dart';

class PetCardListViewBlocCBuilder extends StatelessWidget {
  const PetCardListViewBlocCBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeSuccess) {
            if (state.pets.isEmpty) {
              return const Center(child: Text("No pets found!"));
            }

            return ListView.builder(
              itemCount: state.pets.length,
              itemBuilder: (context, index) {
                final pet = state.pets[index];

                final bool isFavorite = state.favoritesMap.containsKey(
                  pet.image?.id,
                );

                return GestureDetector(
                  onTap: () =>
                      context.pushNamed(Routes.detailsScreen, arguments: pet),
                  child: PetCard(
                    petModels: pet,
                    isFavorite: isFavorite, // Pass the correct boolean value
                  ),
                );
              },
            );
          }

          if (state is HomeError) {
            // It's better to show an error widget directly in the list view
            return Center(
              child: Text(state.errorMessage ?? 'An error occurred.'),
            );
          }

          // For the HomeInitial state
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
