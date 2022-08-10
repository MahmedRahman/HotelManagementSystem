import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';
import 'package:project/app/core/dialog.dart';
import 'package:project/app/core/shared_page/app_loading.dart';
import 'package:project/app/core/shared_page/app_not_internet.dart';
import 'package:project/app/features/room_special_features/domain/entities/room_special_features.dart';
import 'package:project/app/features/room_special_features/presentaion/controller/special_feature_controller.dart';

import '../../../../config/routes/app_pages.dart';

class SpecialFeaturesListView extends GetView<SpecialFeatureController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => buildBody(
          featuresList: state, context: context, isEmptyWidget: false),
      onEmpty: buildBody(context: context, isEmptyWidget: true),
      onError: app_error,
      onLoading: app_loading(),
    );
  }

  Padding buildBody(
      {List<SpecialFeatureEntity>? featuresList,
      required BuildContext context,
      required bool isEmptyWidget}) {

    Widget bntController(SpecialFeatureEntity featureEntity) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              controller.viewSpecialFeature(featureEntity);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => controller.editSpecialFeature(featureEntity),
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
                  controller.deleteFeatureSpecial(featureEntity);
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
              featuresList!.length,
              (index) {
                final feature = featuresList[index];

                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        feature.name!,
                      ),
                    ),
                    DataCell(
                      Text(feature.state.toString()),
                    ),
                    DataCell(
                      Text(feature.order.toString()),
                    ),
                    DataCell(
                      bntController(
                        feature,
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
                        'المميزات الخاصة',
                        style: TextStyle(
                          color: KWhite,
                          height: 1.5,
                        ),
                      ),
                      subtitle: Text(
                        'إجمالي المميزات الخاصة ${featuresList?.length ?? 0}',
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
                    onPressed: () =>
                        Get.toNamed(Routes.SpecialFeatureAddOrEditView)),
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: KWhite,
                  ),
                  onPressed: () {
                    controller.getAllSpecialFeatures();
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
