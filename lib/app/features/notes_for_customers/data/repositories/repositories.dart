import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/notes_for_customers/domain/repositoties/note_for_customer_repo.dart';

import '../../domain/entities/note_for_customer.dart';

List<NoteForCustomer> notes = [];

class NotesCustomerRepositoriesImpl implements NoteForCustomerRepository {
  @override
  Future<Either<Failure, List<NoteForCustomer>>> getAllNotes() async {
    return Right(notes);
  }

  @override
  Future<Either<Failure, Unit>> addNote(NoteForCustomer note) async {
    notes.add(note);
    return Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateNote(
      NoteForCustomer oldNote, NoteForCustomer newNotes) async {
    int itemIndex = notes.indexOf(oldNote);
    notes.remove(oldNote);
    notes.insert(itemIndex, newNotes);
    return Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteNote(NoteForCustomer note) async {
    notes.remove(note);
    return Right(unit);
  }
}
