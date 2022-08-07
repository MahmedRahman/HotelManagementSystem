import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/customers/presentation/controller/customers_controller.dart';
import 'app/translations/app_translations.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Hotel Management System",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      translations: AppTranslation(),
      locale: const Locale('ar', 'EG'),
      initialBinding: Binding(),
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
    ),
  );
}

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomersController>(
      () => CustomersController(),
      fenix: true,
    );
  }
}
