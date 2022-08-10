import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';

import '../../../notes_for_customers/presentation/pages/list_note.dart';

class UnitGeneralView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  Widget buildBody(UnitGeneral unitGeneral) {
    return Scaffold(
      body: ListView(
        children: [
          buildHelperTile(text: 'تفاصيل المميزات العامة', icon: null),
          buildHelperLabel(
            helperText: 'الاسم',
            text: unitGeneral.name.toString(),
          ),
          buildHelperLabel(
            helperText: 'التليفون',
            text: unitGeneral.state.toString(),
          ),
          buildHelperLabel(
            helperText: 'البريد الالكترونى',
            text: unitGeneral.order.toString(),
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
