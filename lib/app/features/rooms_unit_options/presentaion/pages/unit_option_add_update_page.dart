import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/responsive.dart';
import 'package:project/app/core/shared_components/build_button.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/core/shared_components/build_text_form_field.dart';
import 'package:project/app/core/validate.dart';

import '../../domain/entities/unit_option.dart';
import '../controller/special_feature_controller.dart';

class UnitOptionAddEdit extends GetView<UnitOptionController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    UnitOptionEntity optionEntity;
    if (Get.arguments == null) {
      optionEntity = UnitOptionEntity(name: '', order: 1, state: true);
    } else {
      isEdit = true;
      optionEntity = Get.arguments as UnitOptionEntity;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBoxSpaceH20(),
              buildHelperTile(
                text: isEdit ? 'تعديل خيار' : 'اضافة خيار جديد',
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
                        buildRowInColumn(
                          context: context,
                          left: buildTextFormField(
                              labelText: 'الاسم',
                              requiredFiled: true,
                              inputMinLetterNumber: 3,
                              inputMaxLetterNumber: 250,
                              inputLetterType: LetterType.LetterBothWithSpace,
                              initialValue: optionEntity.name,
                              onChanged: (vlu) => optionEntity.name = vlu),
                          right: buildTextFormField(
                            labelText: 'الرتيب',
                            requiredFiled: true,
                            inputMaxLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: optionEntity.order.toString(),
                            onChanged: (vlu) => optionEntity.order =
                                int.tryParse(vlu.toString()),
                            onSaved: (value) {
                              optionEntity.order =
                                  int.tryParse(value.toString());
                            },
                          ),
                        ),
                        kSizedBoxSpaceH10(),
                        // status
                        Switch.adaptive(value: true, onChanged: (newValue) {}),
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
                        controller.updateUnitOption(
                          oldFeature: optionEntity,
                          newFeature: optionEntity,
                        );
                        Get.back();
                        return;
                      }

                      controller.addUnitOption(optionEntity);
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
