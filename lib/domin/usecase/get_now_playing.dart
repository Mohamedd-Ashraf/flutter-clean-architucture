
import 'package:either_dart/either.dart';

import '../../core/network/failure.dart';
import '../entites/movies.dart';
import '../repository/base_repository.dart';
import 'base_usecase.dart';

class GetNowPlayingUsecase extends BaseUseCase<List<Movies>>{
  BaseRepository baseRepository;
GetNowPlayingUsecase(this.baseRepository);

  @override
  Future<Either<Failure, List<Movies>>> call() async {
    return await baseRepository.getNowPlayingRepository();
  }

} 