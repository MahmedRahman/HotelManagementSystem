import 'package:get/get.dart';
import 'package:project/app/features/customers/presentation/pages/add.dart';
import 'package:project/app/features/customers/presentation/pages/list.dart';
import 'package:project/app/features/customers/presentation/pages/view.dart';
import 'package:project/app/features/dashBoard/presentation/pages/dashBoard.dart';
import 'package:project/dash_borad.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DashBoard;

  static final routes = [
    GetPage(
      name: _Paths.CustomerListView,
      page: () => CustomersListView(),
    ),
    GetPage(
      name: _Paths.CustomerAddorEditView,
      page: () => CustomerAddorEdit(),
    ),
    GetPage(
      name: _Paths.CustomerView,
      page: () => CustomerView(),
    ),
    GetPage(
      name: _Paths.DashBoard,
      page: () => DashBoard(),
    ),
    GetPage(
      name: _Paths.DashBoardMain,
      page: () => DashBoardView(),
    ),
  ];
}
