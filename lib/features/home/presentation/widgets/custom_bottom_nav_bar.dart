import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/helpers/extensions.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/features/favorite/presentation/logic/cubit/favorite_cubit.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedItem = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
  ];
  List<String> screens = const [
    Routes.homeScreen,
    Routes.favoriteScreen,
    Routes.detailsScreen,
    Routes.detailsScreen,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        selectedItemColor: const Color(0xFF37BAA6),
        unselectedItemColor: Colors.grey,
        onTap: (value) => setState(() {
          context.pushNamed(screens[value]);
          if (value == 1) {
            BlocProvider.of<FavoriteCubit>(context).emitFavoriteStates();
          }
          selectedItem = value;
        }),
        type: BottomNavigationBarType.fixed,
        items: List.generate(items.length, (index) => items[index]),
      ),
    );
  }
}
