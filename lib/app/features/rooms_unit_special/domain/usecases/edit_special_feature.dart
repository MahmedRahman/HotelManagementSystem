import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/room_special_features.dart';
import '../repositories/room_special_feature_repo.dart';

class EditSpecialFeatureUseCase {
  final RoomSpecialFeaturesRepository _repository;

  EditSpecialFeatureUseCase(this._repository);

  Future<Either<Failure, Unit>> call(
    SpecialFeatureEntity oldFeature,
    SpecialFeatureEntity newFeature,
  ) async {
    return await _repository.updateSpecialFeature(oldFeature, newFeature);
  }
}
