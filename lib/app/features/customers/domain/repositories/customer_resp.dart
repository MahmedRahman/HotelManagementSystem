import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getAllCustomers();
  Future<Either<Failure, Unit>> addCustomer(Customer customer);
  Future<Either<Failure, Unit>> updateCustomer(Customer oldCustomer, Customer newCustomer);
  Future<Either<Failure, Unit>> deleteCustomer(Customer customer);
}
