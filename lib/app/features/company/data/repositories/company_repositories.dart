import 'package:dartz/dartz.dart';
import 'package:project/app/core/enumerate.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/data/network/api_manager.dart';
import 'package:project/app/data/network/api_manager_getx.dart';
import 'package:project/app/features/company/data/datasources/company_remote_data_source.dart';
import 'package:project/app/features/company/data/models/companys_model.dart';
import 'package:project/app/features/company/domain/entities/companys.dart';
import 'package:project/app/features/company/domain/repositories/company_resp.dart';

class CompanyRepositories extends CompanyRepository {
  CompanyRemoteRepository companyRemoteRepositoryImp;
  CompanyRepositories(this.companyRemoteRepositoryImp);
  @override
  Future<Either<Failure, List<Company>>> getAllCompany() async {
    var data = await companyRemoteRepositoryImp.getAllCompany();

    data.fold(
      (l) => Left(l),
      (r) {
        CompanysModel companys = CompanysModel.fromJson(r);
        return Right([companys]);
      },
    );
    return Right([]);
  }

  @override
  Future<Either<Failure, Unit>> addCompany(Company company) async {
    var data = await companyRemoteRepositoryImp.getAllCompany();
    data.fold(
      (l) => Left(l),
      (r) {
        return Right(unit);
      },
    );
    return Right(unit);
  }
}
