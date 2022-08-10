import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/room_special_features.dart';

abstract class RoomSpecialFeaturesRepository {
  Future<Either<Failure, List<SpecialFeatureEntity>>> getAllSpecialFeatures();
  Future<Either<Failure, Unit>> addSpecialFeature(
      SpecialFeatureEntity unitGeneral);
  Future<Either<Failure, Unit>> updateSpecialFeature(
      SpecialFeatureEntity oldFeature, SpecialFeatureEntity newFeature);
  Future<Either<Failure, Unit>> deleteSpecialFeature(
      SpecialFeatureEntity unitGeneral);
}
