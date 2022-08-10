import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';

abstract class UnitGeneralRepository {
  Future<Either<Failure, List<UnitGeneral>>> getAllUnitGeneral();
  Future<Either<Failure, Unit>> addUnitGeneral(UnitGeneral unitGeneral);
  Future<Either<Failure, Unit>> updateUnitGeneral(UnitGeneral unitGeneral);
  Future<Either<Failure, Unit>> deleteUnitGeneral(UnitGeneral unitGeneral);
}