import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';

import 'package:project/app/features/rooms_unit_general/domain/repositories/unit_general_resp.dart';

List<UnitGeneral> unitGeneralList = [];

class UnitGeneralRepositoryImpl implements UnitGeneralRepository {
  @override
  Future<Either<Failure, List<UnitGeneral>>> getAllUnitGeneral() async {
    return Right(unitGeneralList);
  }

  @override
  Future<Either<Failure, Unit>> addUnitGeneral(UnitGeneral unitGeneral) async {
    unitGeneralList.add(unitGeneral);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateUnitGeneral(UnitGeneral unitGeneral) async {
    // unitGeneralList.remove(unitGeneral);
    //unitGeneralList.add(unitGeneral);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteUnitGeneral(UnitGeneral unitGeneral) async {
    unitGeneralList.remove(unitGeneral);
    return right(unit);
  }
}
