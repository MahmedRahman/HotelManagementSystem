import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/features/rooms_levels/domain/entities/rooms_levels.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';

class RoomsLevelsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  Widget buildBody(RoomsLevels roomsLevels) {
    return Scaffold(
      body: ListView(
        children: [
          buildHelperTile(text: 'تفاصيل المميزات العامة', icon: null),
          buildHelperLabel(
            helperText: 'الاسم',
            text: roomsLevels.name.toString(),
          ),
          buildHelperLabel(
            helperText: 'الحالة',
            text: roomsLevels.state.toString(),
          ),
          buildHelperLabel(
            helperText: 'الترتيب',
            text: roomsLevels.order.toString(),
          ),
        ],
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
