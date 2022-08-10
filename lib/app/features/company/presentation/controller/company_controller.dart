import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/company/data/repositories/company_repositories.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';

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
        getAllCompany();
      },
    );
  }

  void updateCustomer({
    required Company company,
  }) async {
    var data = await CompanyRepositoriesImp().updateCompany(company);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllCompany();
      },
    );
  }

  void viewCompany(Company company) {
    Get.toNamed(
      Routes.CompanyView,
      arguments: company,
    );
  }

  void editCompany(Company company) {
    Get.toNamed(
      Routes.CompanyAddorEditView,
      arguments: company,
    );
  }

  void deleteCompany(Company company) async {
    var data = await CompanyRepositoriesImp().deleteCompany(company);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllCompany();
      },
    );
  }
}
