import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/features/rooms_unit_special/domain/entities/room_special_features.dart';

import '../../domain/entities/unit_option.dart';

class UnitOptionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  Widget buildBody(UnitOptionEntity unitOptionEntity) {
    return Scaffold(
      body: ListView(
        children: [
          buildHelperTile(text: 'تفاصيل', icon: null),
          buildHelperLabel(
            helperText: 'الاسم',
            text: unitOptionEntity.name!,
          ),
          buildHelperLabel(
            helperText: 'الحالة',
            text: unitOptionEntity.state.toString(),
          ),
          buildHelperLabel(
            helperText: 'الترتيب',
            text: unitOptionEntity.order.toString(),
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
