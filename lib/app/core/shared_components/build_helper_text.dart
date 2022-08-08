import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/color/app_color.dart';

Widget buildHelperTile({
  required String text,
  required IconData? icon,
}) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: KMain,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Row(
        children: [
          Row(
            children: [
              icon == null
                  ? SizedBox.shrink()
                  : Icon(
                      icon,
                      color: Colors.white,
                    ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: KWhite,
                ),
                textAlign: TextAlign.right,
              ),
            ],
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
