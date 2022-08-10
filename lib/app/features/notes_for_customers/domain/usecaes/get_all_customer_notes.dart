import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/notes_for_customers/domain/repositoties/note_for_customer_repo.dart';

import '../entities/note_for_customer.dart';

class GetAllNotesCustomerUseCase {
  final NoteForCustomerRepository _noteForCustomerRepository;

  GetAllNotesCustomerUseCase(this._noteForCustomerRepository);

  Future<Either<Failure, List<NoteForCustomer>>> call() async {
    return await _noteForCustomerRepository.getAllNotes();
  }
}
