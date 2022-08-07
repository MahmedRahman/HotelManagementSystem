import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';

class AddCustomerUseCase {
  final CustomerRepository _customersRepository;

  AddCustomerUseCase(this._customersRepository);

  Future<Either<Failure, Unit>> call(Customer customer) async {
    return await _customersRepository.addCustomer(customer);
  }
}
