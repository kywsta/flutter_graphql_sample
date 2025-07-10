import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_subscription_test/core/error/failures.dart';

abstract class Repository {
  Future<Either<T, Failure>> on<T>(Future<T> Function() fn) async {
    try {
      return Left(await fn());
    } catch (e, s) {
      FlutterError.presentError(FlutterErrorDetails(exception: e, stack: s));
      return Right(Failure(exception: e, stackTrace: s));
    }
  }
}
