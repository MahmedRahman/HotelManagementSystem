import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';

Future<void> customShowAnimatedDialog({
  required String message,
}) async {
  return showAnimatedDialog<void>(
    context: Get.context!,
    barrierDismissible: false,
    animationType: DialogTransitionType.scale,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(seconds: 1),
    builder: (BuildContext context) {
      return ClassicGeneralDialogWidget(
        titleText: "warning",
        contentText: message,
        onPositiveClick: () {
          Navigator.of(context).pop();
        },
        onNegativeClick: () {
          Navigator.of(context).pop();
        },
        actions: <Widget>[
          FlatButton(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration:
                  const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: const Text(
                "okay",
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> dialogSuccess({
  required String title,
  required String message,
  dynamic Function()? btnOkOnPress,
}) async {
  AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: btnOkOnPress,
    btnOkColor: Colors.green,
  ).show();
}

Future<void> dialogError({
  required String title,
  required String message,
}) async {
  AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.ERROR,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
  ).show();
}

Future<void> dialogWarning({
  required String title,
  required String message,
}) async {
  AwesomeDialog(
    context: Get.context!,
    dialogType: DialogType.WARNING,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: () {},
  ).show();
}

Future<void> dialogYesNo({
  required String title,
  required String message,
  dynamic Function()? btnYesPress,
  dynamic Function()? btnNoPress,
}) async {
  AwesomeDialog(
    width: 500,
    context: Get.context!,
    dialogType: DialogType.QUESTION,
    animType: AnimType.SCALE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: message,
    btnOkText: 'موافق',
    btnOkOnPress: btnYesPress,
    btnCancelText: 'إلغاء',
    btnCancelOnPress: btnNoPress,
  ).show();
}
