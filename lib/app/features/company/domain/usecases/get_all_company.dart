import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/company/domain/repositories/company_resp.dart';

import '../entities/companys.dart';

class GetAllCompanyUseCase {
  GetAllCompanyUseCase(this.repository);

  final CompanyRepository repository;

  Future<Either<Failure, List>> call() async {
    return await repository.getAllCompany();
  }
}
