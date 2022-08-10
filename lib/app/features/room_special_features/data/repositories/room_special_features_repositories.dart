import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/room_special_features/domain/entities/room_special_features.dart';
import 'package:project/app/features/room_special_features/domain/repositories/room_special_feature_repo.dart';

List<SpecialFeatureEntity> features = [];

class SpecialFeatureRepositoryImpl implements RoomSpecialFeaturesRepository {
  @override
  Future<Either<Failure, List<SpecialFeatureEntity>>>
      getAllSpecialFeatures() async {
    return Right(features);
  }

  @override
  Future<Either<Failure, Unit>> addSpecialFeature(
      SpecialFeatureEntity featureEntity) async {
    features.add(featureEntity);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateSpecialFeature(
      SpecialFeatureEntity oldFeature, SpecialFeatureEntity newFeature) async {
    features.remove(oldFeature);
    features.add(newFeature);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteSpecialFeature(
      SpecialFeatureEntity featureEntity) async {
    features.remove(featureEntity);
    return right(unit);
  }
}
