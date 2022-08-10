import 'package:flutter/material.dart';
import 'package:project/app/core/color/app_color.dart';

Widget buildButton({required void Function() onPressed, required String text}) {
  return Container(
    width: double.infinity,
    child: MaterialButton(
      height: 60,
      color: KMain,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: KWhite,
          fontSize: 16,
        ),
      ),
    ),
  );
}
