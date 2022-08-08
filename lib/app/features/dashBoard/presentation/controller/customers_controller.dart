import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/customers/data/repositories/customer_repositories.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';
import 'package:project/app/features/customers/domain/usecases/get_all_customer.dart';
import 'package:project/app/features/customers/presentation/pages/add.dart';

class DashBoardController extends GetxController with StateMixin {
  @override
  void onInit() async {
    return super.onInit();
  }
}
