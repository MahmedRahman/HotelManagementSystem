import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/constans/app_constants.dart';

enum LetterType {
  LetterArabic,
  LetterEnglish,
  LetterBoth,
  LetterBothWithSpace,
  LettersAndNumbers,
  LetterWithSpecialCharacters,
  Number,
  none,
}

var letterBothWithSpaceRegExp =
    r'(^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$)';
var letterBothRegExp =
    r'(^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$)';

Widget buildTextFormField({
  required String labelText,
  String? hintText,
  TextInputType? keyboardType,
  TextEditingController? controller,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  void Function(String?)? onSaved,
  ValueChanged<String>? onChanged,
  LetterType inputLetterType = LetterType.none,
  int inputMaxLetterNumber = 250,
  int inputMinLetterNumber = 0,
  int maxLines = 1,
  bool requiredFiled = false,
  String? initialValue,
}) {
  List<TextInputFormatter>? inputFormatters = [];
  inputFormatters.add(LengthLimitingTextInputFormatter(inputMaxLetterNumber));
  if (inputLetterType == LetterType.Number)
    inputFormatters
        .add(FilteringTextInputFormatter.allow((RegExp(r'(^\d*\.?\d*)'))));

  if (inputLetterType == LetterType.LetterArabic)
    inputFormatters
        .add(FilteringTextInputFormatter.allow((RegExp(r'(^\d*\.?\d*)'))));

  if (inputLetterType == LetterType.LetterBoth)
    inputFormatters.add(
      FilteringTextInputFormatter.allow(
        (RegExp(letterBothRegExp)),
      ),
    );

  if (inputLetterType == LetterType.LetterBothWithSpace)
    inputFormatters.add(
      FilteringTextInputFormatter.allow(
        (RegExp(letterBothWithSpaceRegExp)),
      ),
    );

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
      TextFormField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        initialValue: initialValue,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          hintText: hintText == null ? labelText : hintText,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        controller: controller,
        validator: (value) {
          if (requiredFiled == true) {
            if (value == null || value.isEmpty) return 'Please enter some text';

            if (inputMinLetterNumber != 0) {
              if (value.length < inputMinLetterNumber)
                'الحقل يجب أن يكون أكثر من ${inputMinLetterNumber.toString()} أحرف';
            }
            ;
          }
          ;

          if (requiredFiled == false) {
            if (inputMinLetterNumber != 0) {
              if (value!.length < inputMinLetterNumber)
                'الحقل يجب أن يكون أكثر من ${inputMinLetterNumber.toString()} أحرف';
            }
            ;
          }
          ;

          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
      ),
    ],
  );
}
