import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:project/app/config/routes/app_pages.dart';
import 'package:project/app/features/customers/data/repositories/customer_repositories.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';
import 'package:project/app/features/customers/domain/usecases/get_all_customer.dart';
import 'package:project/app/features/customers/presentation/pages/add.dart';

class CustomersController extends GetxController with StateMixin<List<Customer>> {
  @override
  void onInit() async {
    getAllCustomers();
    return super.onInit();
  }

  void getAllCustomers() async {
    GetAllCustomerUseCase getAllCustomerUseCase = GetAllCustomerUseCase(CustomerRepositoriesImpl());
    var data = await getAllCustomerUseCase.call();
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

  void addCustomer(Customer customer) async {
    var data = await CustomerRepositoriesImpl().addCustomer(customer);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllCustomers();
      },
    );
  }

  void updateCustomer({
    required Customer oldCustomer,
    required Customer newCustomer,
  }) async {
    var data = await CustomerRepositoriesImpl().updateCustomer(oldCustomer, newCustomer);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllCustomers();
      },
    );
  }

  void deleteCustomer(Customer customer) async {
    var data = await CustomerRepositoriesImpl().deleteCustomer(customer);
    data.fold(
      (failure) {
        change(null, status: RxStatus.error(failure.toString()));
      },
      (customers) {
        change(null, status: RxStatus.success());
        getAllCustomers();
      },
    );
  }

  void viewCustomer(Customer customer) {
    Get.toNamed(
      Routes.CustomerView,
      arguments: customer,
    );
  }

  void editCustomer(Customer customer) {
    Get.toNamed(
      Routes.CustomerAddorEditView,
      arguments: customer,
    );
  }
}
