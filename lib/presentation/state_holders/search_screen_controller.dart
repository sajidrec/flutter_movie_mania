import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_mania/data/models/movie_details_model.dart';
import 'package:movie_mania/data/utility/urls_util.dart';

class SearchScreenController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  final List<MovieDetailsModel> _allMovies = [];

  List<MovieDetailsModel> get getAllMovies => _allMovies;

  Future<void> fetchSearchResult({
    required String keyword,
  }) async {
    _inProgress = true;
    update();

    final dio = Dio();

    _allMovies.clear();

    try {
      dynamic result = await dio.get(
        UrlsUtil.getSearchResult(keyword: keyword),
      );

      for (int i = 0; i < result.data.length; i++) {
        _allMovies.add(MovieDetailsModel.fromJson(result.data[i]));
      }
    } catch (e) {}

    _inProgress = false;
    update();
  }
}
