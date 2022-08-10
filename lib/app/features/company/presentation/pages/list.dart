import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';
import 'package:project/app/core/dialog.dart';
import 'package:project/app/core/shared_page/app_empty.dart';
import 'package:project/app/core/shared_page/app_loading.dart';
import 'package:project/app/core/shared_page/app_not_internet.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/company/presentation/controller/company_controller.dart';

class CompanyListView extends GetView<CompanyController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => buildBody(state),
      onEmpty: app_empty(
        title: 'لا يوجد شركات',
        msg: 'قم باضافة شركاتك الان',
        onPressed: () {
          Get.toNamed(Routes.CompanyAddorEditView);
        },
      ),
      onError: app_error,
      onLoading: app_loading(),
    );
  }

  Scaffold buildBody(List<Company>? companyList) {
    Widget bntController(Company company) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () {
              // controller.viewCustomer(customer);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // controller.editCustomer(customer);
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
                  //  controller.deleteCustomer(customer);
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
          'اسم الشركة',
          textAlign: TextAlign.center,
        ),
      ),
      DataColumn(
        label: Text(
          'هاتف الشركة',
        ),
      ),
      DataColumn(
        label: Text(
          'المدينة',
        ),
      ),
      DataColumn(
        label: Text(
          'الشخص المسؤل',
        ),
      ),
      DataColumn(
        label: Text(
          'هاتف الشخص المسؤل',
        ),
      ),
      DataColumn(
        label: Text(
          'البريد الإلكتروني',
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
        companyList!.length,
        (index) => DataRow(
          cells: [
            DataCell(
              Text(
                companyList.elementAt(index).name.toString(),
              ),
            ),
            DataCell(
              Text(
                companyList.elementAt(index).phone.toString(),
              ),
            ),
            DataCell(
              Text(
                companyList.elementAt(index).city.toString(),
              ),
            ),
            DataCell(
              Text(
                companyList.elementAt(index).personInchargeName.toString(),
              ),
            ),
            DataCell(
              Text(
                companyList.elementAt(index).personInchargePhone.toString(),
              ),
            ),
            DataCell(
              Text(
                companyList.elementAt(index).email.toString(),
              ),
            ),
            DataCell(
              bntController(
                companyList.elementAt(index),
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
                          'عدد العملاء : ${companyList.length}',
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
                      controller.getAllCompany();
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
