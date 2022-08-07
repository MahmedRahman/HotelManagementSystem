import 'package:dartz/dartz.dart';
import 'package:project/app/core/enumerate.dart';
import 'package:project/app/core/failures.dart';

abstract class ApiManager {
  Future<Either<Failure, Map<String, dynamic>>> execute({
    required String url,
    required ExecuteType executeType,
    dynamic body,
  });
}
