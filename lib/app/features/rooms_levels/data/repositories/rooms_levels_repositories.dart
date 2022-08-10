import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/rooms_levels/domain/entities/rooms_levels.dart';
import 'package:project/app/features/rooms_levels/domain/repositories/rooms_levels._resp.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';

import 'package:project/app/features/rooms_unit_general/domain/repositories/unit_general_resp.dart';

List<RoomsLevels> roomsLevelsList = [];

class RoomsLevelsRepositoryImpl implements RoomsLevelsRepository {
  @override
  Future<Either<Failure, List<RoomsLevels>>> getAllRoomsLevels() async {
    return Right(roomsLevelsList);
  }

  @override
  Future<Either<Failure, Unit>> addRoomsLevels(RoomsLevels roomsLevels) async {
    roomsLevelsList.add(roomsLevels);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateRoomsLevels(RoomsLevels roomsLevels) async {
    // unitGeneralList.remove(unitGeneral);
    //unitGeneralList.add(unitGeneral);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteRoomsLevels(RoomsLevels roomsLevels) async {
    roomsLevelsList.remove(roomsLevels);
    return right(unit);
  }
}
