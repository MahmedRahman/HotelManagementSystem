import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';

var flg = true.obs;
Widget buildStatusFormField({
  required String labelText,
  bool requiredFiled = false,
  bool initialValue = true,
  required void Function(bool) onChanged,
}) {
  flg.value = initialValue;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
      Row(
        children: [
          Obx(() {
            return FlutterSwitch(
              width: 80,
              valueFontSize: 20.0,
              toggleSize: 40.0,
              borderRadius: 5.0,
              switchBorder: Border.all(color: Colors.blueAccent, width: 0),
              toggleBorder: Border.all(color: KMain, width: 0),
              value: flg.value,
              onToggle: (val) {
                flg.value = !flg.value;
                onChanged(flg.value);
              },
            );
          }),
        ],
      ),

      kSizedBoxSpaceH10(),
      // TextFormField(
      //   keyboardType: keyboardType,
      //   inputFormatters: inputFormatters,
      //   initialValue: initialValue,
      //   maxLines: maxLines,
      //   onChanged: onChanged,
      //   decoration: InputDecoration(
      //     fillColor: Colors.grey[200],
      //     hintText: hintText == null ? labelText : hintText,
      //     filled: true,
      //     enabledBorder: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //     border: OutlineInputBorder(
      //       borderSide: BorderSide(color: Colors.grey),
      //     ),
      //   ),
      //   controller: controller,
      //   validator: (value) {
      //     if (requiredFiled == true) {
      //       if (value == null || value.isEmpty) return 'Please enter some text';

      //       if (inputMinLetterNumber != 0) {
      //         if (value.length < inputMinLetterNumber)
      //           'الحقل يجب أن يكون أكثر من ${inputMinLetterNumber.toString()} أحرف';
      //       }
      //       ;
      //     }
      //     ;

      //     if (requiredFiled == false) {
      //       if (inputMinLetterNumber != 0) {
      //         if (value!.length < inputMinLetterNumber)
      //           'الحقل يجب أن يكون أكثر من ${inputMinLetterNumber.toString()} أحرف';
      //       }
      //       ;
      //     }
      //     ;

      //     return null;
      //   },
      //   onFieldSubmitted: onFieldSubmitted,
      //   onSaved: onSaved,
      // ),
    ],
  );
}
