import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/room_special_features.dart';
import '../repositories/room_special_feature_repo.dart';

class AddSpecialFeatureUseCase {
  final RoomSpecialFeaturesRepository _repository;

  AddSpecialFeatureUseCase(this._repository);

  Future<Either<Failure, Unit>> call(SpecialFeatureEntity featureEntity) async {
    return await _repository.addSpecialFeature(featureEntity);
  }
}
