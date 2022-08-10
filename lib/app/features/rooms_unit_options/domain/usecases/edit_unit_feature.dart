import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/unit_option.dart';
import '../repositories/room_special_feature_repo.dart';

class EditUnitOptionUseCase {
  final UnitOptionRepository _repository;

  EditUnitOptionUseCase(this._repository);

  Future<Either<Failure, Unit>> call(
    UnitOptionEntity oldUnitOption,
    UnitOptionEntity newUnitOption,
  ) async {
    return await _repository.updateUnitOption(oldUnitOption, newUnitOption);
  }
}
