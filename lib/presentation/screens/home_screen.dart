import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/presentation/screens/details_screen.dart';
import 'package:movie_mania/presentation/screens/search_screen.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appThemeBlack,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            children: [
              _buildSearchMovieButton(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) => _buildMovieItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieItem() {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsScreen());
      },
      child: Container(
        child: Column(
          children: [
            Image.network(
              height: Get.height / 3.8,
              "https://static.tvmaze.com/uploads/images/medium_portrait/425/1064746.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 1),
            Text(
              "All American",
              style: TextStyle(
                color: AppColors.appThemeWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "When a rising high school football player from South Central L.A. is recruited to play for Beverly Hills High, the wins, losses and struggles of two families from vastly different worlds — Compton and Beverly Hills — begin to collide. Inspired by the life of pro football player Spencer Paysinger.",
              style: TextStyle(
                color: AppColors.appThemeWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchMovieButton() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColors.appThemeRed,
          ),
        ),
        onPressed: () {
          Get.to(() => const SearchScreen());
        },
        child: const Text(
          "Search movies",
          style: TextStyle(
            color: AppColors.appThemeWhite,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
