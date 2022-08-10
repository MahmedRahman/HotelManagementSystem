import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/app/constans/app_constants.dart';
import 'package:project/app/core/color/app_color.dart';

Widget app_empty({
  required String title,
  required String msg,
  required void Function()? onPressed,
}) {
  return Scaffold(
    body: Center(
      child: Container(
        width: Get.width * 0.4,
        //height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(
                0,
                20,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottiefiles/23522-general-design.json',
            ),
            kSizedBoxSpaceH10(),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            kSizedBoxSpaceH10(),
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    height: 2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            kSizedBoxSpaceH10(),
            kDivider(),
            kSizedBoxSpaceH10(),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  KMain,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: KMain),
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'أضافة  عنصر جديد',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // icon: Icon(Icons.add),
              onPressed: onPressed,
            ),
            kSizedBoxSpaceH10(),
            kSizedBoxSpaceH20(),
          ],
        ),
      ),
    ),
  );
}
