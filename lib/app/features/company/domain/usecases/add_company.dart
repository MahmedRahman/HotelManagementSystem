import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';

import '../../../customers/domain/entities/customers.dart';
import '../repositories/company_resp.dart';

class AddCompanyUseCase {
  final CompanyRepository _companysRepository;

  AddCompanyUseCase(this._companysRepository);

  Future<Either<Failure, Unit>> call(Company company) async {
    return await _companysRepository.addCompany(company);
  }
}
