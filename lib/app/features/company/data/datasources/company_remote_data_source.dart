import 'package:dartz/dartz.dart';
import 'package:project/app/core/enumerate.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/data/network/api_manager.dart';

abstract class CompanyRemoteRepository {
  Future<Either<Failure, Map<String, dynamic>>> getAllCompany();
  Future<Either<Failure, Map<String, dynamic>>> addCompany();
}

class CompanyRemoteRepositoryImp implements CompanyRemoteRepository {
  ApiManager apiManager;
  CompanyRemoteRepositoryImp(this.apiManager);

  @override
  Future<Either<Failure, Map<String, dynamic>>> addCompany() async {
    var data = await apiManager.execute(
      url: '',
      executeType: ExecuteType.get,
    );

    return data;
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllCompany() async {
    var data = await apiManager.execute(
      url: '',
      executeType: ExecuteType.get,
    );
    // TODO: implement getAllCompany
    return data;
  }
}
