import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/constans/look_up_tabel.dart';
import 'package:project/app/core/validate.dart';
import 'package:project/app/features/customers/presentation/controller/customers_controller.dart';
import 'package:project/app/core/shared_components/build_button.dart';
import 'package:project/app/core/shared_components/build_drop_down_from_look_up_table.dart';
import 'package:project/app/core/shared_components/build_date_time_picker_field.dart';
import 'package:project/app/core/shared_components/build_text_form_field.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/core/dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../domain/entities/customers.dart';

class CustomerAddorEdit extends GetView<CustomersController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    Customer customer;
    if (Get.arguments == null) {
      customer = Customer(
        id: -1,
        name: '',
        phone: '',
      );
    } else {
      isEdit = true;
      customer = Get.arguments as Customer;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBoxSpaceH20(),
              buildHelperTile(text: isEdit ? 'تعديل عميل' : 'أضافة عميل جديد'),
              kSizedBoxSpaceH20(),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildRowInColumn(
                          left: buildTextFormField(
                            labelText: 'الاسم',
                            requiredFiled: true,
                            inputMinLetterNumber: 3,
                            inputMaxLetterNumber: 250,
                            inputLetterType: LetterType.LetterBothWithSpace,
                            initialValue: customer.name,
                            onSaved: (value) {
                              customer.name = value.toString();
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'رقم الجوال',
                            requiredFiled: true,
                            inputMaxLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: customer.phone,
                            onSaved: (value) {
                              customer.phone = value.toString();
                            },
                          ),
                        ),
                        kSizedBoxSpaceH10(),
                        buildRowInColumn(
                          left: buildDropdownFromLookUpTable(
                            labelText: 'نوع العميل',
                            items: LookUpTable.customer_types,
                            selectedItem: customer.customerTypeId == null
                                ? null
                                : {
                                    'id': customer.customerTypeId,
                                    'name': customer.customerTypeString,
                                  },
                            onSaved: (value) {
                              customer.customerTypeId = value!['id'];
                              customer.customerTypeString = value['name'];
                            },
                          ),
                          right: buildDropdownFromLookUpTable(
                            labelText: 'الجنسية',
                            items: LookUpTable.nationalities,
                            selectedItem: customer.nationalityId == null
                                ? null
                                : {
                                    'id': customer.nationalityId,
                                    'name': customer.nationalityString,
                                  },
                            onSaved: (value) {
                              customer.nationalityId = value!['id'];
                              customer.nationalityString = value['name'];
                            },
                          ),
                        ),
                        kSizedBoxSpaceH10(),
                        buildRowInColumn(
                          left: buildDropdownFromLookUpTable(
                            labelText: 'نوع الهوية',
                            items: LookUpTable.id_types,
                            selectedItem: customer.typeId == null
                                ? null
                                : {
                                    'id': customer.typeId,
                                    'name': customer.typeString,
                                  },
                            onSaved: (value) {
                              customer.typeId = value!['id'];
                              customer.typeString = value['name'];
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'رقم الهوية',
                            inputMaxLetterNumber: 10,
                            inputMinLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            initialValue: customer.idNumber,
                            onSaved: (value) {
                              customer.idNumber = value;
                            },
                          ),
                        ),
                        kSizedBoxSpaceH10(),
                        buildDateTimePickerField(
                          labelText: 'تاريخ انتهاء الهوية',
                          initialValue: customer.idExpireDate,
                          firstDate: DateTime.now().year,
                          onSaved: (value) {
                            customer.idExpireDate = value.toString();
                          },
                        ),
                        kSizedBoxSpaceH10(),
                        buildRowInColumn(
                          left: buildDropdownFromLookUpTable(
                            labelText: 'الجنس',
                            selectedItem: customer.genderId == null
                                ? null
                                : {
                                    'id': customer.genderId,
                                    'name': customer.genderString,
                                  },
                            items: LookUpTable.gender,
                            onSaved: (value) {
                              customer.genderId = value!['id'];
                              customer.genderString = value['name'];
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'البريد الإلكتروني',
                            initialValue: customer.email,
                            onSaved: (value) {
                              customer.email = value.toString();
                            },
                          ),
                        ),
                        kSizedBoxSpaceH10(),
                        buildDateTimePickerField(
                          labelText: 'تاريخ الميلاد',
                          initialValue: customer.birthdayDate,
                          lastDate: DateTime.now().year - 18,
                          onSaved: (value) {
                            customer.birthdayDate = value.toString();
                          },
                        ),
                        kSizedBoxSpaceH10(),
                        buildTextFormField(
                          labelText: 'العنوان',
                          initialValue: customer.address,
                          onSaved: (value) {
                            customer.address = value.toString();
                          },
                        ),
                        kSizedBoxSpaceH10(),
                        buildRowInColumn(
                          left: buildTextFormField(
                            labelText: 'العمل',
                            initialValue: customer.work,
                            onSaved: (value) {
                              customer.work = value.toString();
                            },
                          ),
                          right: buildTextFormField(
                            labelText: 'هاتف العمل',
                            initialValue: customer.workPhone,
                            inputLetterType: LetterType.Number,
                            inputMinLetterNumber: 5,
                            validator: validateMobile,
                            onSaved: (value) {
                              customer.workPhone = value.toString();
                            },
                          ),
                        ),
                        kSizedBoxSpaceH10(),
                        buildDropdownFromLookUpTable(
                          labelText: 'تصنيف العميل',
                          items: LookUpTable.customer,
                          selectedItem: customer.customerCategoryId == null
                              ? null
                              : {
                                  'id': customer.customerCategoryId,
                                  'name': customer.customerCategoryString,
                                },
                          onSaved: (value) {
                            customer.customerCategoryId = value!['id'];
                            customer.customerCategoryString = value['name'];
                          },
                        ),
                        kSizedBoxSpaceH20(),
                      ],
                    ),
                  ),
                  buildButton(
                    text: isEdit ? 'تعديل' : 'حفظ',
                    onPressed: () {
                      if (_formKey.currentState!.validate() == false) {
                        return;
                      }
                      _formKey.currentState!.save();

                      if (isEdit) {
                        controller.updateCustomer(
                          oldCustomer: customer,
                          newCustomer: customer,
                        );
                        Get.back();
                        return;
                      }

                      controller.addCustomer(customer);
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
