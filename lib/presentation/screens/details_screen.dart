import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:movie_mania/data/models/movie_details_model.dart'
    as movie_details_model;
import 'package:movie_mania/presentation/utility/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movieDetailsModel,
  });

  final movie_details_model.MovieDetailsModel movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appThemeBlack,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  movieDetailsModel.show?.image?.original ?? "",
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.broken_image,
                    color: AppColors.appThemeRed,
                    size: Get.width / 3,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  movieDetailsModel.show?.name ?? "",
                  style: const TextStyle(
                    color: AppColors.appThemeWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(
                      Uri.parse(movieDetailsModel.show?.url ?? ""),
                    );
                  },
                  child: Text(
                    movieDetailsModel.show?.url ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.appThemeBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.appThemeYellow,
                    ),
                    Text(
                      movieDetailsModel.show?.rating?.average?.toString() ??
                          "Unrated",
                      style: const TextStyle(
                        color: AppColors.appThemeWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Type : ${movieDetailsModel.show?.type}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.appThemeWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Genres : ${movieDetailsModel.show?.genres?.join(", ")}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.appThemeWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Language : ${movieDetailsModel.show?.language ?? "Not specified"}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.appThemeWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                HtmlWidget(
                  movieDetailsModel.show?.summary ?? "",
                  textStyle: const TextStyle(
                    color: AppColors.appThemeLightWhite,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
