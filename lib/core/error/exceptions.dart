import 'package:graphql_flutter/graphql_flutter.dart';

class NetworkException implements Exception {}

class ParseException implements Exception {}

class UnauthorizedException implements Exception {}

class ForbiddenException implements Exception {}

class NotFoundException implements Exception {}

class BadRequestException implements Exception {}

class InternalServerErrorException implements Exception {}

class ServiceUnavailableException implements Exception {}

class NoDataException implements Exception {

}

class GQLException implements Exception {
  final OperationException exception;

  GQLException(this.exception);
}
