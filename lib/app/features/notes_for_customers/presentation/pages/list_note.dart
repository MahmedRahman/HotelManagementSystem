import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';
import 'package:project/app/core/dialog.dart';
import 'package:project/app/core/shared_page/app_loading.dart';
import 'package:project/app/core/shared_page/app_not_internet.dart';

import '../../../../core/shared_components/build_text_form_field.dart';
import '../../../customers/domain/entities/customers.dart';
import '../../domain/entities/note_for_customer.dart';
import '../controller/note_for_customer_controller.dart';

class NoteCustomersListView extends GetView<NotesForCustomersController> {
  NoteCustomersListView({required this.customer});
  Customer customer;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>
          buildBody(notesList: state, context: context, isEmptyWidget: false),
      onEmpty: buildBody(context: context, isEmptyWidget: true),
      onError: app_error,
      onLoading: app_loading(),
    );
  }

  Padding buildBody(
      {List<NoteForCustomer>? notesList,
      required BuildContext context,
      required bool isEmptyWidget}) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    void show(BuildContext context, {NoteForCustomer? note}) {
      bool isEdit = false;
      NoteForCustomer? noteForCustomer;
      if (note == null) {
        noteForCustomer = NoteForCustomer(
            note: '',
            createdAt: DateTime.now().toString().substring(0, 10),
            createdBy: '',
            customerId: customer.id.toString());
      } else {
        isEdit = true;
        noteForCustomer = note;
      }

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: buildTextFormField(
                          labelText: 'من فضلك ادخل ملاحظتك هنا',
                          requiredFiled: true,
                          inputMinLetterNumber: 3,
                          maxLines: 4,
                          inputMaxLetterNumber: 250,
                          inputLetterType: LetterType.LetterBothWithSpace,
                          initialValue: note?.note ?? '',
                          onChanged: (vlu) => noteForCustomer?.setNote = vlu,
                          onSaved: (value) {
                            noteForCustomer?.note = value!;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          child: Text("اضافه ملاحظه"),
                          onPressed: () {
                            if (_formKey.currentState!.validate() == false) {
                              return;
                            }
                            _formKey.currentState!.save();

                            if (isEdit) {
                              controller.updateNote(
                                  oldNote: noteForCustomer!,
                                  newNote: noteForCustomer);
                              Get.back();
                              return;
                            }
                            controller.addNote(noteForCustomer!);
                            Get.back();
                          }),
                    )
                  ],
                ),
              ),
            );
          });
    }

    Widget bntController(NoteForCustomer note) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              controller.viewNote(note);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => show(context, note: note),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              dialogYesNo(
                title: 'هل انت متأكد ؟',
                message: 'لا يمكن التراجع عن الحذف, هل ترغب بالإستمرار ؟',
                btnNoPress: () {
                  Get.back();
                },
                btnYesPress: () {
                  controller.deleteNote(note);
                },
              );
            },
          )
        ],
      );
    }

    var tableHeader = [
      DataColumn(
        label: Text(
          'محتوى الملاحظة',
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'الموظف',
        ),
      ),
      DataColumn(
        label: Text(
          'تاريخ الاضافة',
        ),
      ),
      DataColumn(
        label: Text(
          '',
        ),
      ),
    ];

    DataTable dt1 = DataTable(
      // border: TableBorder.n,

      headingTextStyle: TextStyle(
        fontSize: 14,
        color: KSecondary,
        fontWeight: FontWeight.w700,
        fontFamily: 'Cairo',
      ),
      columnSpacing: 10,
      dataRowHeight: 80,
      dataTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Cairo',
      ),
      headingRowColor: MaterialStateColor.resolveWith(
        (states) {
          return KMain;
        },
      ),
      columns: tableHeader,
      rows: isEmptyWidget
          ? List.generate(
              1,
              (index) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '',
                      ),
                    ),
                    DataCell(
                      Text('لم يتم اضافه ملاخطات'),
                    ),
                    DataCell(
                      Text(''),
                    ),
                    DataCell(
                      Text(''),
                    ),
                  ],
                );
              },
            )
          : List.generate(
              notesList!.length,
              (index) {
                final note = notesList[index];

                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        note.note,
                      ),
                    ),
                    DataCell(
                      Text(note.createdBy!),
                    ),
                    DataCell(
                      Text(note.createdAt!),
                    ),
                    DataCell(
                      bntController(
                        note,
                      ),
                    ),
                  ],
                );
              },
            ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: KMain,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: KMain,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: KGray,
                        size: 32,
                      ),
                      title: Text(
                        'ملاحظات على العميل',
                        style: TextStyle(
                          color: KWhite,
                          height: 1.5,
                        ),
                      ),
                      subtitle: Text(
                        'إجمالي الملاحظات علي العميل ${notesList?.length ?? 0}',
                        style: TextStyle(
                          color: KWhite70,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: KWhite,
                  ),
                  onPressed: () => show(context),
                ),
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: KWhite,
                  ),
                  onPressed: () {
                    controller.getAllNotes();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
          kSizedBoxSpaceH20(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: Get.width,
            child: dt1,
          ),
        ],
      ),
    );
  }
}

var tableHeader = [
  DataColumn(
    label: Text(
      'محتوى الملاحظة',
      textAlign: TextAlign.center,
    ),
  ),
  DataColumn(
    label: Text(
      'الموظف',
    ),
  ),
  DataColumn(
    label: Text(
      'تاريخ الاضافة',
    ),
  ),
  DataColumn(
    label: Text(
      '',
    ),
  ),
];
