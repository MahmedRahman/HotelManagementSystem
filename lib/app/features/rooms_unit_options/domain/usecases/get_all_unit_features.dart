import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/unit_option.dart';
import '../repositories/room_special_feature_repo.dart';

class GetAllUnitOptionUseCase {
  final UnitOptionRepository _repository;

  GetAllUnitOptionUseCase(this._repository);

  Future<Either<Failure, List<UnitOptionEntity>>> call() async {
    return await _repository.getAllUnitOptions();
  }
}
