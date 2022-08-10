import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/rooms_unit_options/domain/entities/unit_option.dart';

abstract class UnitOptionRepository {
  Future<Either<Failure, List<UnitOptionEntity>>> getAllUnitOptions();
  Future<Either<Failure, Unit>> addUnitOption(UnitOptionEntity unitOption);
  Future<Either<Failure, Unit>> updateUnitOption(
      UnitOptionEntity oldUnitOption, UnitOptionEntity newUnitOption);
  Future<Either<Failure, Unit>> deleteUnitOption(UnitOptionEntity unitOption);
}
