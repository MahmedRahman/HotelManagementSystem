import 'package:dartz/dartz.dart';
import 'package:project/app/core/enumerate.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/data/network/api_manager.dart';
import 'package:project/app/data/network/api_manager_getx.dart';
import 'package:project/app/features/company/data/datasources/company_remote_data_source.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/company/domain/repositories/company_resp.dart';

List<Company> companyList = [];

class CompanyRepositoriesImp extends CompanyRepository {
  @override
  Future<Either<Failure, List<Company>>> getAllCompany() async {
    return Right(companyList);
  }

  @override
  Future<Either<Failure, Unit>> addCompany(Company company) async {
    companyList.add(company);
    return Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteCompany(Company company) {
    // TODO: implement deleteCompany
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateCompany(Company company) {
    // TODO: implement updateCompany
    throw UnimplementedError();
  }

  
}
