import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/constans/look_up_tabel.dart';
import 'package:project/app/core/responsive.dart';
import 'package:project/app/core/shared_components/build_status_form_field.dart';
import 'package:project/app/core/validate.dart';
import 'package:project/app/core/shared_components/build_button.dart';
import 'package:project/app/core/shared_components/build_drop_down_from_look_up_table.dart';
import 'package:project/app/core/shared_components/build_date_time_picker_field.dart';
import 'package:project/app/core/shared_components/build_text_form_field.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/features/rooms_levels/domain/entities/rooms_levels.dart';
import 'package:project/app/features/rooms_levels/presentation/controller/unit_general_controller.dart';
import 'package:project/app/features/rooms_unit_general/domain/entities/unit_general_entites.dart';
import 'package:project/app/features/rooms_unit_general/presentation/controller/unit_general_controller.dart';

class RoomsLevelsAddorEditView extends GetView<RoomsLevelsController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    RoomsLevels roomsLevels;
    if (Get.arguments == null) {
      roomsLevels = RoomsLevels(
        id: -1,
      );
    } else {
      isEdit = true;
      roomsLevels = Get.arguments as RoomsLevels;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBoxSpaceH20(),
              buildHelperTile(
                text: isEdit ? 'تعديل المميزات العامة' : 'أضافة المميزات العامة',
                icon: Icons.new_label,
              ),
              kSizedBoxSpaceH10(),
              Divider(
                color: Colors.grey[500],
              ),
              kSizedBoxSpaceH10(),
              Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildTextFormField(
                          labelText: 'الاسم',
                          requiredFiled: true,
                          inputMinLetterNumber: 3,
                          inputMaxLetterNumber: 250,
                          inputLetterType: LetterType.LetterBothWithSpace,
                          initialValue: roomsLevels.name.toString(),
                          onSaved: (value) {
                            roomsLevels.name = value.toString();
                          },
                        ),
                        kSizedBoxSpaceH10(),
                        buildStatusFormField(
                          labelText: 'الحالة',
                          initialValue: roomsLevels.state,
                          onChanged: (value) {
                            roomsLevels.state = value;
                          },
                        ),
                        kSizedBoxSpaceH10(),
                        buildTextFormField(
                          labelText: 'الترتيب',
                          inputMinLetterNumber: 1,
                          inputMaxLetterNumber: 3,
                          inputLetterType: LetterType.Number,
                          initialValue: roomsLevels.order.toString(),
                          onSaved: (value) {
                            roomsLevels.order = int.parse(value.toString());
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
                        controller.updateRoomsLevels(
                          RoomsLevels: roomsLevels,
                        );
                        Get.back();
                        return;
                      }

                      controller.addRoomsLevels(roomsLevels);
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

  Widget buildRowInColumn({
    required Widget left,
    required Widget right,
    required BuildContext context,
  }) {
    return Responsive.isMobile(context)
        ? Column(
            children: [
              left,
              kSizedBoxSpaceH10(),
              right,
            ],
          )
        : Row(
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
