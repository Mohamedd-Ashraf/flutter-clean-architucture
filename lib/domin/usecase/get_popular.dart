import 'package:either_dart/either.dart';

import '../../core/network/failure.dart';
import '../entites/movies.dart';
import '../repository/base_repository.dart';
import 'base_usecase.dart';

class GetPopularUsecase extends BaseUseCase<List<Movies>> {

  final BaseRepository _baseRepository;
  GetPopularUsecase(this._baseRepository);
  @override
  Future<Either<Failure, List<Movies>>> call() async{

    return await _baseRepository.popularRepository();
  }

} 