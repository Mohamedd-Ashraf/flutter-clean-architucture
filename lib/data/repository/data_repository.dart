import 'package:data_session/data/data_source/remote_source/remote_data_source.dart';
import 'package:data_session/domin/repository/base_repository.dart';
import 'package:either_dart/either.dart';
import '../../core/network/failure.dart';
import '../../domin/entites/movies.dart';

class DataRepository extends BaseRepository{
   BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  DataRepository(this.baseMovieRemoteDataSource);

  @override
  Future <Either<Failure,List<Movies>>> getNowPlayingRepository()async{
    try{
      return Right(await baseMovieRemoteDataSource.getNowPlaying());
    } catch (e){
      return const Left(Failure("There is an error"));
    }
  }
  @override
  Future <Either<Failure,List<Movies>>> topRatedRepository() async{
    try{
      return Right(await baseMovieRemoteDataSource.topRated());
    } catch (e){
    return Left(Failure("There is an error:\n ${e.toString()}"));
    }
  }
  @override
  Future <Either<Failure,List<Movies>>> popularRepository() async{
    try{
      return Right(await baseMovieRemoteDataSource.popularRepository());
    } catch (e){
    return Left(Failure("There is an error:\n $e"));
    }
  }

}