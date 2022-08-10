import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/responsive.dart';
import 'package:project/app/core/shared_components/build_button.dart';
import 'package:project/app/core/shared_components/build_helper_text.dart';
import 'package:project/app/core/shared_components/build_text_form_field.dart';
import 'package:project/app/core/validate.dart';
import 'package:project/app/features/room_special_features/domain/entities/room_special_features.dart';

import '../controller/special_feature_controller.dart';

class SpecialFeatureAddEdit extends GetView<SpecialFeatureController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    SpecialFeatureEntity featureEntity;
    if (Get.arguments == null) {
      featureEntity = SpecialFeatureEntity(name: '', order: 1, state: true);
    } else {
      isEdit = true;
      featureEntity = Get.arguments as SpecialFeatureEntity;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBoxSpaceH20(),
              buildHelperTile(
                text: isEdit ? 'تعديل ميزة خاصة' : 'اضافة ميزة خاصة',
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
                              initialValue: featureEntity.name,
                              onChanged: (vlu) => featureEntity.name = vlu),
                          right: buildTextFormField(
                            labelText: 'الرتيب',
                            requiredFiled: true,
                            inputMaxLetterNumber: 20,
                            inputLetterType: LetterType.Number,
                            validator: validateMobile,
                            initialValue: featureEntity.order.toString(),
                            onChanged: (vlu) => featureEntity.order =
                                int.tryParse(vlu.toString()),
                            onSaved: (value) {
                              featureEntity.order =
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
                        controller.updateSpecialFeature(
                          oldFeature: featureEntity,
                          newFeature: featureEntity,
                        );
                        Get.back();
                        return;
                      }

                      controller.addSpecialFeature(featureEntity);
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
