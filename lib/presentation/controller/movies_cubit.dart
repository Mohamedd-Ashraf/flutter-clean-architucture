
import 'package:data_session/domin/entites/movies.dart';
import 'package:data_session/domin/usecase/get_now_playing.dart';
import 'package:data_session/domin/usecase/get_top_rated.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domin/usecase/get_popular.dart';
import 'movies_states.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase) : super(MoviesInitialState());
  static MoviesCubit get(context) => BlocProvider.of(context);
  List<Movies> nowPlayingMovies = [];
  List<Movies> popularMovies = [];
  List<Movies> topRatedMovies = [];
  final GetNowPlayingUsecase getNowPlayingMoviesUseCase;
  final GetPopularUsecase getPopularMoviesUseCase;
  final GetTopRatedUseCase getTopRatedMoviesUseCase;
  void getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());


    final result = await getNowPlayingMoviesUseCase.call();


    result.fold((l) => emit(GetNowPlayingMoviesErrorState()), (r) {
      nowPlayingMovies = r;
      emit(GetNowPlayingMoviesSuccessState());
    });
  }

  void getPopularMovies() async {
    emit(GetNowPlayingMoviesLoadingState());


    final result = await getPopularMoviesUseCase.call();


    result.fold((l) => emit(GetNowPlayingMoviesErrorState()), (r) {
      popularMovies = r;
      emit(GetNowPlayingMoviesSuccessState());
    });
  }

  void getTopRatedMovies() async {
    emit(GetNowPlayingMoviesLoadingState());


    final result = await getTopRatedMoviesUseCase.call();


    result.fold((l) => emit(GetNowPlayingMoviesErrorState()), (r) {
      topRatedMovies = r;
      emit(GetNowPlayingMoviesSuccessState());
    });
  }
}
