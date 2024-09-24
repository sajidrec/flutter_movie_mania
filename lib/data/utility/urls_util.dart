class UrlsUtil {
  static const String allMovieListUrl =
      "https://api.tvmaze.com/search/shows?q=all";

  static String getSearchResult({required String keyword}) =>
      "https://api.tvmaze.com/search/shows?q=$keyword";
}
