import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';

class GetAllCustomerUseCase {
  final CustomerRepository _customersRepository;

  GetAllCustomerUseCase(this._customersRepository);

   Future<Either<Failure, List<Customer>>> call() async {
    return await _customersRepository.getAllCustomers();
  }
}