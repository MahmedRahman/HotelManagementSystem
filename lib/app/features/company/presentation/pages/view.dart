import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project/app/core/shared_page/app_empty.dart';
import 'package:project/app/core/shared_page/app_loading.dart';
import 'package:project/app/core/shared_page/app_not_internet.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/presentation/controller/customers_controller.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';

class CustomerView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  Widget buildBody(Customer customer) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            buildHelperTile(text: 'تفاصيل العميل',    icon: null,),
            buildHelperLabel(
              helperText: 'الاسم',
              text: customer.name,
            ),
            buildHelperLabel(
              helperText: 'التليفون',
              text: customer.phone,
            ),
            buildHelperLabel(
              helperText: 'البريد الالكترونى',
              text: customer.email.toString(),
            ),
            buildHelperLabel(
              helperText: 'العنوان',
              text: customer.address.toString(),
            ),
            buildHelperLabel(
              helperText: 'الجنس',
              text: customer.genderString.toString(),
            ),
            buildHelperLabel(
              helperText: 'نوع العميل',
              text: customer.customerCategoryString.toString(),
            ),
            buildHelperLabel(
              helperText: 'نوع الهوية',
              text: customer.typeString.toString(),
            ),
            buildHelperLabel(
              helperText: 'رقم الهوية',
              text: customer.idNumber.toString(),
            ),
            buildHelperLabel(
              helperText: 'العمل',
              text: customer.work.toString(),
            ),
            buildHelperLabel(
              helperText: 'هاتف العمل',
              text: customer.workPhone.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHelperLabel({
    required String helperText,
    required String text,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            SizedBox(
              width: 350,
              child: Text(
                helperText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: text == '' ? Text('-') : Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
