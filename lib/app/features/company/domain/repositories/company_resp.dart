import 'package:dartz/dartz.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<Company>>> getAllCompany();
  Future<Either<Failure, Unit>> addCompany(Company company);
}
