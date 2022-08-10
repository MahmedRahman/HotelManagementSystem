import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';

class CompanyView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  Widget buildBody(Company company) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            buildHelperTile(
              text: 'تفاصيل الشركة',
              icon: Icons.view_list,
            ),
            buildHelperLabel(
              helperText: 'اسم الشركة',
              text: company.name.toString(),
            ),
            buildHelperLabel(
              helperText: 'هاتف الشركة',
              text: company.phone.toString(),
            ),
            buildHelperLabel(
              helperText: 'المدينة',
              text: company.city.toString(),
            ),
            buildHelperLabel(
              helperText: 'عنوان الشركة',
              text: company.address.toString(),
            ),
            buildHelperLabel(
              helperText: 'الشخص المسؤل',
              text: company.personInchargeName.toString(),
            ),
            buildHelperLabel(
              helperText: 'هاتف الشخص المسؤل',
              text: company.personInchargePhone.toString(),
            ),
            buildHelperLabel(
              helperText: 'البريد الإليكترونى',
              text: company.email.toString(),
            ),
            buildHelperLabel(
              helperText: 'الرقم الضريبي',
              text: company.taxNumber.toString(),
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
