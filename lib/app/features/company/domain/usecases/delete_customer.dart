import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/company/domain/repositories/company_resp.dart';
import 'package:project/app/features/customers/domain/entities/customers.dart';
import 'package:project/app/features/customers/domain/repositories/customer_resp.dart';

class DeleteCustomer {
  final CompanyRepository _companysRepository;

  DeleteCustomer(this._companysRepository);

  Future<Either<Failure, Unit>> call(Company company) async {
    return _companysRepository.deleteCompany(company);
  }
}
