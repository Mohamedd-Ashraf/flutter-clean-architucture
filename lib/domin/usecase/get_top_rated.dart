
import 'package:either_dart/either.dart';

import '../../core/network/failure.dart';
import '../entites/movies.dart';
import '../repository/base_repository.dart';
import 'base_usecase.dart';

class GetTopRatedUseCase extends BaseUseCase<List<Movies>>{
  BaseRepository baseRepository;

  GetTopRatedUseCase(this.baseRepository);
  @override
  Future<Either<Failure, List<Movies>>> call() async{
   return await baseRepository.topRatedRepository();
    
  }
  
} 