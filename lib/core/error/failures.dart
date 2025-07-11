import 'package:flutter_graphql_sample/core/error/exceptions.dart';

class Failure {
  final dynamic exception;
  final StackTrace? stackTrace;

  final FailureInterpretation interpretation;

  Failure({required this.exception, this.stackTrace})
      : interpretation =
            FailuerInterpretationHelper().getInterpretation(exception);
}

class FailureInterpretation {
  final String title;
  final String message;

  FailureInterpretation({required this.title, required this.message});
}

class FailuerInterpretationHelper {
  final Map<Type, FailureInterpretation> _interpretations = {
    UnauthorizedException: FailureInterpretation(
      title: 'Unauthorized',
      message: 'Please login to continue.',
    ),
    NetworkException: FailureInterpretation(
      title: 'Connection Error',
      message: 'Please check your internet connection and try again.',
    ),
    ForbiddenException: FailureInterpretation(
      title: 'Forbidden',
      message: 'You are not allowed to access this resource.',
    ),
    NotFoundException: FailureInterpretation(
      title: 'Not Found',
      message: 'The requested resource was not found.',
    ),
    BadRequestException: FailureInterpretation(
      title: 'Error',
      message:
          'Unable to process your request, please check your inputs and try again.',
    ),
    InternalServerErrorException: FailureInterpretation(
      title: 'Error',
      message:
          'Sorry, something went wrong at our end, please try again later.',
    ),
    ServiceUnavailableException: FailureInterpretation(
      title: 'Error',
      message:
          'Sorry, our service is currently unavailable, please try again later.',
    ),
  };

  FailureInterpretation getInterpretation(Object exception) {
    switch (exception) {
      case UnauthorizedException():
        return _interpretations[UnauthorizedException]!;
      case NetworkException():
        return _interpretations[NetworkException]!;
      case ForbiddenException():
        return _interpretations[ForbiddenException]!;
      case NotFoundException():
        return _interpretations[NotFoundException]!;
      case BadRequestException():
        return _interpretations[BadRequestException]!;
      case InternalServerErrorException():
        return _interpretations[InternalServerErrorException]!;
      case ServiceUnavailableException():
        return _interpretations[ServiceUnavailableException]!;
      default:
        return FailureInterpretation(
            title: "Error", message: "Sorry, something went wrong.");
    }
  }
}
