import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/date_utils.dart';

Widget buildDateTimePickerField({
  required String labelText,
  required void Function(String?)? onSaved,
  String? initialValue,
  TextInputType? keyboardType,
  TextEditingController? controller,
  String? Function(String?)? validator,
  List<TextInputFormatter>? inputFormatters,
  bool requiredFiled = false,
  void Function(String)? onFieldSubmitted,
  int? firstDate,
  int? lastDate,
}) {
  var date = initialValue.obs;

  if (date.value == null) {
    date = labelText.obs;
  }

  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            requiredFiled
                ? Text(
                    '*',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      height: 1,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        kSizedBoxSpaceH10(),
        InkWell(
          onTap: () {
            showDatePicker(
              context: Get.context!,
              initialDate: lastDate == null ? DateTime.now() : DateTime(lastDate),
              firstDate: firstDate == null ? DateTime(1900) : DateTime(firstDate),
              lastDate: lastDate == null ? DateTime(2050) : DateTime(lastDate),
            ).then(
              (value) {
                if (value != null) {
                  log(value.toString());
                  date.value = value.toString().dateFromString();
                  onSaved?.call(value.toString().dateFromString());
                }
              },
            );
          },
          child: TextFormField(
            enabled: false,
            keyboardType: keyboardType,
            // initialValue: date.value,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              hintText: date.value,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            controller: controller,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            // onSaved: onSaved,
          ),
        ),
      ],
    );
  });
}
