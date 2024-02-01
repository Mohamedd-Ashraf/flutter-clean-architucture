
import 'package:data_session/data/data_source/remote_source/remote_data_source.dart';
import 'package:data_session/data/repository/data_repository.dart';
import 'package:data_session/domin/repository/base_repository.dart';
import 'package:data_session/domin/usecase/get_now_playing.dart';
import 'package:data_session/domin/usecase/get_popular.dart';
import 'package:data_session/domin/usecase/get_top_rated.dart';
import 'package:data_session/presentation/controller/movies_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt= GetIt.instance;

class ServicesLocator {
  void init(){

    getIt.registerFactory(() => MoviesCubit(getIt(), getIt(),getIt()));

    getIt.registerLazySingleton(() => GetNowPlayingUsecase(getIt()));
    getIt.registerLazySingleton(() => GetPopularUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt()));
    getIt.registerLazySingleton<BaseRepository>(() => DataRepository(getIt()));

    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => RemoteDataSource());
  }
}