
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/validate.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/company/presentation/controller/company_controller.dart';
import 'package:project/app/core/shared_components/build_button.dart';
import 'package:project/app/core/shared_components/build_text_form_field.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';

class CompanyAddorEditView extends GetView<CompanyController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    Company company;
    if (Get.arguments == null) {
      company = Company(id: -1);
    } else {
      isEdit = true;
      company = Get.arguments as Company;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBoxSpaceH20(),
              buildHelperTile(
                text: isEdit ? 'تعديل عميل' : 'أضافة شركة جديد',
                icon: null,
              ),
              kSizedBoxSpaceH20(),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildRowInColumn(
                          left: buildTextFormField(
                            labelText: 'اسم الشركة',
                            requiredFiled: true,
                            inputMinLetterNumber: 3,
                            inputMaxLetterNumber: 500,
                            inputLetterType: LetterType.LetterBothWithSpace,
                            initialValue: company.name,
                            onSaved: (value) {
                              company.name = value.toString();
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'هاتف الشركة',
                            requiredFiled: true,
                            inputMaxLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: company.phone,
                            onSaved: (value) {
                              company.phone = value.toString();
                            },
                          ),
                        ),
                        kSizedBoxSpaceH20(),
                        buildRowInColumn(
                          left: buildTextFormField(
                            labelText: 'المدينة',
                            requiredFiled: true,
                            inputMinLetterNumber: 3,
                            inputMaxLetterNumber: 250,
                            inputLetterType: LetterType.LetterBothWithSpace,
                            initialValue: company.city,
                            onSaved: (value) {
                              company.city = value.toString();
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'عنوان الشركة',
                            requiredFiled: true,
                            inputMaxLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: company.address,
                            onSaved: (value) {
                              company.address = value.toString();
                            },
                          ),
                        ),
                        kSizedBoxSpaceH20(),
                        buildRowInColumn(
                          left: buildTextFormField(
                            labelText: 'الشخص المسؤل',
                            requiredFiled: true,
                            inputMinLetterNumber: 3,
                            inputMaxLetterNumber: 250,
                            inputLetterType: LetterType.LetterBothWithSpace,
                            initialValue: company.personInchargeName,
                            onSaved: (value) {
                              company.personInchargeName = value.toString();
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'هاتف الشخص المسؤل',
                            inputMaxLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: company.personInchargePhone,
                            onSaved: (value) {
                              company.personInchargePhone = value.toString();
                            },
                          ),
                        ),
                        kSizedBoxSpaceH20(),
                        buildRowInColumn(
                          left: buildTextFormField(
                            labelText: 'البريد الإليكترونى',
                            validator: validateEmail,
                            initialValue: company.email,
                            onSaved: (value) {
                              company.email = value.toString();
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'الرقم الضريبي',
                            inputMaxLetterNumber: 15,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: company.taxNumber,
                            onSaved: (value) {
                              company.taxNumber = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  kSizedBoxSpaceH20(),
                  buildButton(
                    text: isEdit ? 'تعديل' : 'حفظ',
                    onPressed: () {
                      if (_formKey.currentState!.validate() == false) {
                        return;
                      }
                      _formKey.currentState!.save();

                      if (isEdit) {
                        // controller.updateCustomer(
                        //   oldCustomer: customer,
                        //   newCustomer: customer,
                        // );
                        Get.back();
                        return;
                      }

                      controller.addCompany(company);
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowInColumn({
    required Widget left,
    required Widget right,
  }) {
    return Row(
      children: [
        Flexible(
          child: left,
        ),
        kSizedBoxSpaceW10(),
        Flexible(
          child: right,
        ),
      ],
    );
  }
}
