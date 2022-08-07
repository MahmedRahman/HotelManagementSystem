import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:project/app/core/enumerate.dart';
import 'package:project/app/core/failures.dart';
import 'package:project/app/data/network/api_manager.dart';

class ApiManagerWithGetx extends GetConnect with ApiManager {
  //final NetworkInfo networkInfo;

  Map<String, String> headersContent = {
    "Authorization": "Bearer ",
    'Content-Type': 'application/json',
  };

  Future<Either<Failure, Map<String, dynamic>>> execute({
    required String url,
    required ExecuteType executeType,
    body,
  }) async {
    log('url: $url');

    // if (InternetConnectionChecker().hasConnection == false) {
    //   log('no internet');
    //   left(OfflineFailure());
    // }

    Response response;

    switch (executeType) {
      case ExecuteType.get:
        response = await get(
          url,
          headers: headersContent,
        );
        break;

      case ExecuteType.post:
        response = await post(
          url,
          body,
          headers: headersContent,
        );
        break;

      case ExecuteType.put:
        response = await put(
          url,
          body,
          headers: headersContent,
        );
        break;

      case ExecuteType.delete:
        response = await delete(
          url,
          headers: headersContent,
        );
        break;
    }

    log('url: $url response: ${response.body} status: ${response.statusCode}');

    if (response.statusCode == 200) return Right(response.body);

    if (response.statusCode == 401) return left(UnauthorizedFailure());

    if (response.statusCode == 404) return left(ServerFailure());

    return left(UnknownFailure());
  }
}
