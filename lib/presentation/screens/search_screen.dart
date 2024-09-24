import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:movie_mania/presentation/screens/details_screen.dart';
import 'package:movie_mania/presentation/state_holders/search_screen_controller.dart';
import 'package:movie_mania/presentation/utility/app_colors.dart';
import 'package:movie_mania/presentation/widgets/center_circular_progress_indicator.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              _buildSearchBox(),
              const SizedBox(height: 12),
              _buildSearchedMovieList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchedMovieList() {
    return Expanded(
      child: GetBuilder<SearchScreenController>(
        builder: (searchScreenController) {
          return searchScreenController.inProgress
              ? const CenterCircularProgressIndicator()
              : searchScreenController.getAllMovies.isEmpty
                  ? const Center(
                      child: Text(
                        "Nothing here",
                        style: TextStyle(
                          color: AppColors.appThemeWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount:
                          searchScreenController.getAllMovies.length ?? 0,
                      itemBuilder: (context, index) => _buildMovieItem(
                        imageUrl: searchScreenController
                                .getAllMovies[index].show?.image?.medium ??
                            "",
                        title: searchScreenController
                                .getAllMovies[index].show?.name ??
                            "",
                        description: searchScreenController
                                .getAllMovies[index].show?.summary ??
                            "",
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                    );
        },
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

  Widget _buildSearchBox() {
    return TextField(
      textInputAction: TextInputAction.search,
      controller: _searchTEController,
      onSubmitted: (keyword) async {
        Get.find<SearchScreenController>().fetchSearchResult(
          keyword: keyword.trim(),
        );
      },
      decoration: InputDecoration(
        fillColor: AppColors.appThemeWhite,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () async {
            Get.find<SearchScreenController>().fetchSearchResult(
              keyword: _searchTEController.text.trim(),
            );
          },
          icon: const Icon(
            Icons.search_rounded,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchTEController.dispose();
  }
}
