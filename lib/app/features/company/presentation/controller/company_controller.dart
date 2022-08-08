import 'package:get/get.dart';
import 'package:project/app/features/company/data/repositories/company_repositories.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/company/domain/repositories/company_resp.dart';
import 'package:project/app/features/customers/data/repositories/customer_repositories.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';
import 'package:project/app/features/customers/domain/usecases/add_customer.dart';
import 'package:project/app/features/customers/domain/usecases/get_all_customer.dart';

import '../../domain/usecases/add_company.dart';

class CompanyController extends GetxController with StateMixin<List<Company>> {
  @override
  void onInit() async {
    getAllCompany();
    return super.onInit();
  }

  void getAllCompany() async {
    var data = await await CompanyRepositoriesImp().getAllCompany();
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        if (customers.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(customers, status: RxStatus.success());
        }
      },
    );
  }

  void addCompany(Company company) async {
    var data = await CompanyRepositoriesImp().addCompany(company);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (companys) {
        change(null, status: RxStatus.success());
      },
    );
    getAllCompany();
  }
}
