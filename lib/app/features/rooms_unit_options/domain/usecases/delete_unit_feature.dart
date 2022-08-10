import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/unit_option.dart';
import '../repositories/room_special_feature_repo.dart';

class DeleteUnitOptionUseCase {
  final UnitOptionRepository _repository;

  DeleteUnitOptionUseCase(this._repository);

  Future<Either<Failure, Unit>> call(UnitOptionEntity unitOptionEntity) async {
    return await _repository.deleteUnitOption(unitOptionEntity);
  }
}
