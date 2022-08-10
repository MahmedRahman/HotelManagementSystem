import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';
import 'package:project/app/features/rooms_unit_general/domain/repositories/unit_general_resp.dart';

class AddCustomerUseCase {
  final UnitGeneralRepository _unitGeneralRepository;

  AddCustomerUseCase(this._unitGeneralRepository);

  Future<Either<Failure, Unit>> call(UnitGeneral unitGeneral) async {
    return await _unitGeneralRepository.addUnitGeneral(unitGeneral);
  }
}
