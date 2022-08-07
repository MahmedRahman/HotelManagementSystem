import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/note_for_customer.dart';
import '../repositoties/note_for_customer_repo.dart';

class AddNoteCustomerUseCase {
  final NoteForCustomerRepository _forCustomerRepository;

  AddNoteCustomerUseCase(this._forCustomerRepository);

  Future<Either<Failure, Unit>> call(NoteForCustomer note) async {
    return await _forCustomerRepository.addNote(note);
  }
}
