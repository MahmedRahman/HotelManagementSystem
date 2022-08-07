import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';

import '../entities/note_for_customer.dart';

abstract class NoteForCustomerRepository {
  Future<Either<Failure, List<NoteForCustomer>>> getAllNotes();
  Future<Either<Failure, Unit>> addNote(NoteForCustomer customer);
  Future<Either<Failure, Unit>> updateNote(NoteForCustomer oldCustomer, NoteForCustomer newCustomer);
  Future<Either<Failure, Unit>> deleteNote(NoteForCustomer customer);
}
