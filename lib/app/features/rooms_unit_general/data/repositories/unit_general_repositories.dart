import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';

List<Customer> customers = [];

class UnitGeneralRepositoryImpl implements CustomerRepository {
  @override
  Future<Either<Failure, List<Customer>>> getAllCustomers() async {
    return Right(customers);
  }

  @override
  Future<Either<Failure, Unit>> addCustomer(Customer customer) async {
    customers.add(customer);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> updateCustomer(Customer oldCustomer, Customer newCustomer) async {
    customers.remove(oldCustomer);
    customers.add(newCustomer);
    return right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteCustomer(Customer customer) async {
    customers.remove(customer);
    return right(unit);
  }

  
}
