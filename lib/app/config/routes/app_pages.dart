import 'package:get/get.dart';
import 'package:project/app/features/company/presentation/pages/add.dart';
import 'package:project/app/features/company/presentation/pages/list.dart';
import 'package:project/app/features/company/presentation/pages/view.dart';
import 'package:project/app/features/customers/presentation/pages/add.dart';
import 'package:project/app/features/customers/presentation/pages/list.dart';
import 'package:project/app/features/customers/presentation/pages/view.dart';
import 'package:project/app/features/dashBoard/presentation/pages/dashBoard.dart';
import 'package:project/app/features/rooms_unit_general/presentation/pages/add.dart';
import 'package:project/app/features/rooms_unit_general/presentation/pages/list.dart';
import 'package:project/app/features/rooms_unit_general/presentation/pages/view.dart';
import 'package:project/dash_borad.dart';

import '../../features/auth/presentation/pages/sign_in.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  //static const INITIAL = Routes.SignIn;
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
    GetPage(
      name: _Paths.CompanyListView,
      page: () => CompanyListView(),
    ),
    GetPage(
      name: _Paths.CompanyView,
      page: () => CompanyView(),
    ),
    GetPage(
      name: _Paths.CompanyAddorEditView,
      page: () => CompanyAddorEditView(),
    ),
    GetPage(
      name: _Paths.UnitGeneralListView,
      page: () => UnitGeneralListView(),
    ),
    GetPage(
      name: _Paths.UnitGeneralView,
      page: () => UnitGeneralView(),
    ),
    GetPage(
      name: _Paths.UnitGeneralAddorEditView,
      page: () => UnitGeneralAddorEditView(),
    ),
    GetPage(
      name: _Paths.SignIn,
      page: () => LoginPage(),
    ),
  ];
}
