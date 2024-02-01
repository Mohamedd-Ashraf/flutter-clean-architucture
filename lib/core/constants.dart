class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/movie";
  static const String apiKey = "58753181cd3845e06dd467a212dada2e";
  static const String getNowPlayingPath =
      "$baseUrl/now_playing?api_key=$apiKey";

  static const String getPopularMoviesPath =
      "$baseUrl/popular?api_key=$apiKey";

  static const String getTopRatedMoviesPath =
      "$baseUrl/top_rated?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=> "$baseImageUrl$path" ;
}