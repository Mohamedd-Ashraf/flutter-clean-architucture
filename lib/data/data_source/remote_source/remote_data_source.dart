// ignore_for_file: non_constant_identifier_names

import 'package:data_session/core/api_server.dart';
import 'package:dio/dio.dart';

import '../../../domin/entites/movies.dart';
import 'package:data_session/core/constants.dart';
abstract class BaseMovieRemoteDataSource {
  Future<List<Movies>> getNowPlaying();
  Future<List<Movies>> popularRepository();
  Future<List<Movies>> topRated();
}
class RemoteDataSource extends BaseMovieRemoteDataSource{
  Dio dio = Dio();
  @override
  Future<List<Movies>> getNowPlaying() {
    ApiService api_service = ApiService(dio);
    dynamic data = api_service.get_data(AppConstants.getNowPlayingPath);
    return data ;
  }

  @override
  Future<List<Movies>> topRated() {
    ApiService api_service = ApiService(dio);
    dynamic data = api_service.get_data(AppConstants.getTopRatedMoviesPath);
    return data;
  }

  @override
  Future<List<Movies>> popularRepository()  {
  ApiService api_service = ApiService(dio);
  dynamic data =  api_service.get_data(AppConstants.getPopularMoviesPath);
  

  
  return data;
}

}
