import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';
import 'package:project/app/core/dialog.dart';
import 'package:project/app/core/shared_page/app_loading.dart';
import 'package:project/app/core/shared_page/app_not_internet.dart';
import 'package:project/app/features/rooms_unit_options/domain/entities/unit_option.dart';
import 'package:project/app/features/rooms_unit_options/presentaion/controller/special_feature_controller.dart';

import '../../../../config/routes/app_pages.dart';
import '../../../../core/shared_page/app_empty.dart';

class UnitOptionsListView extends GetView<UnitOptionController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => buildBody(optionsList: state, context: context, isEmptyWidget: false),
      onEmpty: app_empty(
          title: 'لا يوجد خيارات للوحدات',
          msg: 'قم بالضافة و التحكم بخيارات للوحدات',
          onPressed: () {
            Get.toNamed(Routes.UnitOptionAddOrEditView);
          }),
      onError: app_error,
      onLoading: app_loading(),
    );
  }

  Padding buildBody({List<UnitOptionEntity>? optionsList, required BuildContext context, required bool isEmptyWidget}) {
    Widget bntController(UnitOptionEntity optionEntity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              controller.viewUnitOption(optionEntity);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => controller.editUnitOption(optionEntity),
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
                  controller.deleteFeatureSpecial(optionEntity);
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
        optionsList!.length,
        (index) {
          final option = optionsList[index];

          return DataRow(
            cells: [
              DataCell(
                Text(
                  option.name!,
                ),
              ),
              DataCell(
                option.state
                    ? Text(
                        'مفعل',
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        'غير مفعل',
                        style: TextStyle(color: Colors.red),
                      ),
              ),
              DataCell(
                Text(option.order.toString()),
              ),
              DataCell(
                bntController(
                  option,
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
                        'خيارات الوحدات',
                        style: TextStyle(
                          color: KWhite,
                          height: 1.5,
                        ),
                      ),
                      subtitle: Text(
                        'إجمالي خيارات الوحدات ${optionsList?.length ?? 0}',
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
                    onPressed: () => Get.toNamed(Routes.UnitOptionAddOrEditView)),
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: KWhite,
                  ),
                  onPressed: () {
                    controller.getAllUnitOptions();
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
