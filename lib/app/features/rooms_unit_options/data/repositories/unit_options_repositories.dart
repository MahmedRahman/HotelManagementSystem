import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/rooms_unit_options/domain/entities/unit_option.dart';
import 'package:project/app/features/rooms_unit_options/domain/repositories/room_special_feature_repo.dart';
import 'package:project/app/features/rooms_unit_special/domain/entities/room_special_features.dart';
import 'package:project/app/features/rooms_unit_special/domain/repositories/room_special_feature_repo.dart';

List<UnitOptionEntity> options = [];

class UnitOptionRepositoryImpl implements UnitOptionRepository {
  @override
  Future<Either<Failure, List<UnitOptionEntity>>> getAllUnitOptions() async {
    return Right(options);
  }

  @override
  Future<Either<Failure, Unit>> addUnitOption(
      UnitOptionEntity unitOptionEntity) async {
    options.add(unitOptionEntity);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateUnitOption(
      UnitOptionEntity oldUnitOption, UnitOptionEntity newUnitOption) async {
    options.remove(oldUnitOption);
    options.add(newUnitOption);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteUnitOption(
      UnitOptionEntity unitOptionEntity) async {
    options.remove(unitOptionEntity);
    return right(unit);
  }
}
