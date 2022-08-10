import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/rooms_levels/domain/entities/rooms_levels.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';

abstract class RoomsLevelsRepository {
  Future<Either<Failure, List<RoomsLevels>>> getAllRoomsLevels();
  Future<Either<Failure, Unit>> addRoomsLevels(RoomsLevels roomsLevels);
  Future<Either<Failure, Unit>> updateRoomsLevels(RoomsLevels roomsLevels);
  Future<Either<Failure, Unit>> deleteRoomsLevels(RoomsLevels roomsLevels);
}
