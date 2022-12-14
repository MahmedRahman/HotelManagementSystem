import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';
import 'package:project/app/core/dialog.dart';
import 'package:project/app/core/shared_page/app_empty.dart';
import 'package:project/app/core/shared_page/app_loading.dart';
import 'package:project/app/core/shared_page/app_not_internet.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/presentation/controller/customers_controller.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';
import 'package:project/app/features/rooms_unit_general/presentation/controller/unit_general_controller.dart';

class UnitGeneralListView extends GetView<UnitGeneralController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => buildBody(state),
      onEmpty: app_empty(
          title: 'لا يوجد بالمميزات العامة',
          msg: 'قم باضافة التحكم بالمميزات العامة',
          onPressed: () {
            Get.toNamed(Routes.UnitGeneralAddorEditView);
          }),
      onError: app_error,
      onLoading: app_loading(),
    );
  }

  Scaffold buildBody(List<UnitGeneral>? unitGeneralList) {
    Widget bntController(UnitGeneral unitGeneral) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              controller.viewUnitGeneral(unitGeneral);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              controller.editUnitGeneral(unitGeneral);
            },
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
                  controller.deleteUnitGeneral(unitGeneral);
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
          'الاسم',
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'الحالة',
        ),
      ),
      DataColumn(
        label: Text(
          'ترتيب العرض',
        ),
      ),
      DataColumn(
        label: Text(
          'الاجرائات',
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
      rows: List.generate(
        unitGeneralList!.length,
        (index) => DataRow(
          cells: [
            DataCell(
              Text(
                unitGeneralList.elementAt(index).name.toString(),
              ),
            ),
            DataCell(
              unitGeneralList.elementAt(index).state
                  ? Text(
                      'فعال',
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      'غير فعال',
                      style: TextStyle(color: Colors.red),
                    ),
            ),
            DataCell(
              Text(
                unitGeneralList.elementAt(index).order.toString(),
              ),
            ),
            DataCell(
              bntController(
                unitGeneralList.elementAt(index),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: KGray,
      body: Padding(
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
                          'المميزات العامة',
                          style: TextStyle(
                            color: KWhite,
                            height: 1.5,
                          ),
                        ),
                        subtitle: Text(
                          'عدد المميزات العامة : ${unitGeneralList.length}',
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
                    onPressed: () {
                      Get.toNamed(Routes.UnitGeneralAddorEditView);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: KWhite,
                    ),
                    onPressed: () {
                      controller.getAllUnitGeneral();
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
      ),
    );
  }
}
