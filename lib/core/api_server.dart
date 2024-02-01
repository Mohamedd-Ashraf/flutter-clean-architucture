import 'package:data_session/core/error/exception.dart';
import 'package:data_session/core/network/error_message_model.dart';
import 'package:data_session/data/modules/MovieModel.dart';
import 'package:dio/dio.dart';
import '../domin/entites/movies.dart';

class ApiService{
final Dio dio;

  ApiService(this.dio);
  Future<List<Movies>> get_data(String path) async{
  final response = await Dio().get(path);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
}

}
