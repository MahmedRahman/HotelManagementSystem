import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';

class DeleteCustomer {
  final CustomerRepository _customersRepository;

  DeleteCustomer(this._customersRepository);

  Future<Either<Failure, Unit>> call(Customer customer) async {
    return _customersRepository.deleteCustomer(customer);
  }
}
