import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:project/app/constans/app_constants.dart';

Widget buildDropdownFromLookUpTable({
  required String labelText,
  String? hintText,
  List<Map<String, dynamic>>? items,
  void Function(Map<String, dynamic>?)? onSaved,
  bool requiredFiled = false,
  Map<String, dynamic>? selectedItem,
}) {
  //selectedItem = null;

  return Column(
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
      DropdownSearch<Map<String, dynamic>>(
        // popupProps: PopupProps.bottomSheet(),

        mode: Mode.DIALOG,
        showSelectedItems: false,
        items: items,
        selectedItem: selectedItem,
        itemAsString: (Map<String, dynamic>? u) => u!['name'],
        dropdownSearchDecoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          hintText: hintText == null ? labelText : hintText,
          border: OutlineInputBorder(),
        ),
        onChanged: onSaved,
      ),
    ],
  );
}
