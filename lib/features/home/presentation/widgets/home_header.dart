import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Find Your Forever Pet', style: AppTextStyles.font24BlackBold),
        Spacer(),
        IconButton(
          iconSize: 20,
          icon: const Icon(Icons.notifications_outlined, size: 24),
          onPressed: () {},
        ),
      ],
    );
  }
}
