import 'package:get/get.dart';
import 'package:project/app/features/company/presentation/pages/add.dart';
import 'package:project/app/features/company/presentation/pages/list.dart';
import 'package:project/app/features/company/presentation/pages/view.dart';
import 'package:project/app/features/customers/presentation/pages/add.dart';
import 'package:project/app/features/customers/presentation/pages/list.dart';
import 'package:project/app/features/customers/presentation/pages/view.dart';
import 'package:project/app/features/dashBoard/presentation/pages/dashBoard.dart';
import 'package:project/app/features/room_special_features/presentaion/pages/add_special_feature.dart';
import 'package:project/dash_borad.dart';

import '../../features/auth/presentation/pages/sign_in.dart';
import '../../features/room_special_features/presentaion/pages/view_special_feature.dart';

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
      name: _Paths.SignIn,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.SpecialFeatureAddOrEditView,
      page: () => SpecialFeatureAddEdit(),
    ),
    GetPage(
      name: _Paths.SpecialFeatureView,
      page: () => SpecialFeatureView(),
    ),
  ];
}
