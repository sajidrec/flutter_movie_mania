import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:movie_mania/presentation/screens/details_screen.dart';
import 'package:movie_mania/presentation/screens/search_screen.dart';
import 'package:movie_mania/presentation/state_holders/home_screen_controller.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';
import 'package:movie_mania/presentation/widgets/center_circular_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async =>
          await Get.find<HomeScreenController>().fetchMovieList(),
    );
  }

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
                child: GetBuilder<HomeScreenController>(
                  builder: (homeScreenController) {
                    return homeScreenController.inProgress
                        ? const CenterCircularProgressIndicator()
                        : ListView.separated(
                            itemCount:
                                homeScreenController.getAllMovies.length,
                            itemBuilder: (context, index) => _buildMovieItem(
                              imageUrl: homeScreenController.getAllMovies[index]
                                      .show?.image?.medium ??
                                  "",
                              title: homeScreenController
                                      .getAllMovies[index].show?.name ??
                                  "",
                              description: homeScreenController
                                      .getAllMovies[index].show?.summary ??
                                  "",
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 12,
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieItem({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const DetailsScreen());
      },
      child: Column(
        children: [
          Image.network(
            height: Get.height / 3.8,
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.broken_image,
                color: AppColors.appThemeRed,
                size: Get.height / 5,
              ); // Display an error icon
            },
          ),
          const SizedBox(height: 1),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.appThemeWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          HtmlWidget(
            description,
            textStyle: const TextStyle(
              color: AppColors.appThemeWhite,
            ),
          ),
        ],
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
