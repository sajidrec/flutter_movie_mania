import 'package:flutter/material.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.appThemeRed,
      ),
    );
  }
}
