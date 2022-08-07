import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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

class CustomersListView extends GetView<CustomersController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => buildBody(state),
      onEmpty: app_empty(),
      onError: app_error,
      onLoading: app_loading(),
    );
  }

  Scaffold buildBody(List<Customer>? customerList) {
    Widget bntController(Customer customer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              controller.viewCustomer(customer);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              controller.editCustomer(customer);
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
                  controller.deleteCustomer(customer);
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
          'رقم الجوال',
        ),
      ),
      DataColumn(
        label: Text(
          'البريد الإلكتروني',
        ),
      ),
      DataColumn(
        label: Text(
          'تصنيف العميل',
        ),
      ),
      DataColumn(
        label: Text(
          'الجنس',
        ),
      ),
      DataColumn(
        label: Text(
          'الجنسية',
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
      rows: List.generate(
        customerList!.length,
        (index) => DataRow(
          cells: [
            DataCell(
              Text(
                customerList.elementAt(index).name.toString(),
              ),
            ),
            DataCell(
              Text(
                customerList.elementAt(index).phone.toString(),
              ),
            ),
            DataCell(
              Text(
                customerList.elementAt(index).email.toString(),
              ),
            ),
            DataCell(
              Text(
                customerList.elementAt(index).customerCategoryString.toString(),
              ),
            ),
            DataCell(
              Text(
                customerList.elementAt(index).genderString.toString(),
              ),
            ),
            DataCell(
              Text(
                customerList.elementAt(index).nationalityString.toString(),
              ),
            ),
            DataCell(
              bntController(
                customerList.elementAt(index),
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
                          'العملاء',
                          style: TextStyle(
                            color: KWhite,
                            height: 1.5,
                          ),
                        ),
                        subtitle: Text(
                          'عدد العملاء : ${customerList.length}',
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
                      Get.toNamed(Routes.CustomerAddorEditView);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: KWhite,
                    ),
                    onPressed: () {
                      controller.getAllCustomers();
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
