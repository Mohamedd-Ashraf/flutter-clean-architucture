import 'package:either_dart/either.dart';
import '../../core/network/failure.dart';
import '../entites/movies.dart';

abstract class BaseRepository{
Future <Either<Failure,List<Movies>>> getNowPlayingRepository(); 
Future <Either<Failure,List<Movies>>> topRatedRepository(); 
Future <Either<Failure,List<Movies>>> popularRepository(); 

} 