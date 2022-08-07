import 'package:get/get.dart';
import 'package:project/app/features/customers/data/repositories/customer_repositories.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';
import 'package:project/app/features/customers/domain/usecases/get_all_customer.dart';

class CompanyController extends GetxController with StateMixin<List<Customer>> {
  @override
  void onInit() async {
    GetAllCustomerUseCase getAllCustomerUseCase = GetAllCustomerUseCase(CustomerRepositoriesImpl());
    var data = await getAllCustomerUseCase.call();
    data.fold(
      (failure) {
      

        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(customers, status: RxStatus.success());
      },
    );

    return super.onInit();
  }
}
