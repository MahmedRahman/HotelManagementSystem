import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/core/responsive.dart';
import 'package:project/app/features/dashBoard/presentation/controller/customers_controller.dart';

class DashBoardView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)
          ? Center(
              child: Text('Phone'),
            )
          : Center(
              child: Text('Not Phone'),
            ),
    );
  }
}
