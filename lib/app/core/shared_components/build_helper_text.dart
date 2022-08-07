import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/color/app_color.dart';

Widget buildHelperTile({required String text}) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: KMain,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1,
              color: KWhite,
            ),
            textAlign: TextAlign.right,
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.close,
              color: KWhite,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    ),
  );
}
