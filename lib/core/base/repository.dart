import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_sample/core/error/exceptions.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

abstract class Repository {
  Future<Either<T, Failure>> on<T>(Future<T> Function() fn) async {
    try {
      return Left(await fn());
    } catch (e, s) {
      FlutterError.presentError(FlutterErrorDetails(exception: e, stack: s));
      return Right(Failure(exception: e, stackTrace: s));
    }
  }

  Future<Either<T, Failure>> onGql<T>(
      Future<QueryResult<T>> Function() fn) async {
    try {
      final result = await fn();

      if (result.exception != null) {
        throw result.exception!;
      }

      if (!result.isLoading && result.parsedData == null) {
        throw NoDataException();
      }

      return Left(result.parsedData as T);
    } catch (e, s) {
      FlutterError.presentError(FlutterErrorDetails(exception: e, stack: s));
      return Right(Failure(exception: e, stackTrace: s));
    }
  }

  Stream<T> onGqlStream<T>(Stream<QueryResult<T>> Function() fn) {
    return fn().map((result) {
      if (result.exception != null) {
        throw result.exception!;
      }

      if (!result.isLoading && result.parsedData == null) {
        throw NoDataException();
      }

      return result.parsedData as T;
    }).handleError((e, s) {
      FlutterError.presentError(FlutterErrorDetails(exception: e, stack: s));
    });
  }
}
