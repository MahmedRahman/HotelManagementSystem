import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/customers/data/repositories/customer_repositories.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/usecases/get_all_customer.dart';
import 'package:project/app/features/notes_for_customers/data/repositories/repositories.dart';
import 'package:project/app/features/notes_for_customers/domain/usecaes/get_all_customer_notes.dart';

import '../../domain/entities/note_for_customer.dart';

class NotesForCustomersController extends GetxController
    with StateMixin<List<NoteForCustomer>> {
  @override
  void onInit() async {
    getAllNotes();
    return super.onInit();
  }

  void getAllNotes() async {
    GetAllNotesCustomerUseCase getAllNotesCustomerUseCase =
        GetAllNotesCustomerUseCase(NotesCustomerRepositoriesImpl());
    var data = await getAllNotesCustomerUseCase.call();
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (notes) {
        if (notes.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(notes, status: RxStatus.success());
        }
      },
    );
  }

  void addNote(NoteForCustomer note) async {
    var data = await NotesCustomerRepositoriesImpl().addNote(note);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (notes) {
        change(null, status: RxStatus.success());
        getAllNotes();
      },
    );
  }

  void updateNote({
    required NoteForCustomer OldNote,
    required NoteForCustomer newNote,
  }) async {
    var data = await NotesCustomerRepositoriesImpl()
        .updateNote(OldNote, newNote);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllNotes();
      },
    );
  }

  void deleteNote(NoteForCustomer note) async {
    var data = await NotesCustomerRepositoriesImpl().deleteNote(note);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllNotes();
      },
    );
  }

  void viewNote(NoteForCustomer note) {
    Get.toNamed(
      Routes.CustomerView,
      arguments: note,
    );
  }

  void editNote(NoteForCustomer note) {
    Get.toNamed(
      Routes.CustomerAddorEditView,
      arguments: note,
    );
  }
}
