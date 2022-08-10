import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/room_special_features.dart';
import '../repositories/room_special_feature_repo.dart';

class GetAllSpecialFeatureUseCase {
  final RoomSpecialFeaturesRepository _repository;

  GetAllSpecialFeatureUseCase(this._repository);

  Future<Either<Failure, List<SpecialFeatureEntity>>> call() async {
    return await _repository.getAllSpecialFeatures();
  }
}
