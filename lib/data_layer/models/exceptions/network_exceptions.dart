import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_weather/strings.dart';

import '../enums/network_exception_types.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException._({required this.message});

  factory NetworkException.fromError(error) {
    var exception = _getDioException(error);
    var errorMessage = _getErrorMessage(exception);
    return NetworkException._(message: errorMessage);
  }

  static NetworkExceptionTypes _getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptionTypes networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = NetworkExceptionTypes.requestCancelled;
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = NetworkExceptionTypes.requestTimeout;
              break;
            case DioErrorType.other:
              networkExceptions = NetworkExceptionTypes.noInternetConnection;
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = NetworkExceptionTypes.sendTimeout;
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptionTypes.badRequest;
                  break;
                case 401:
                  networkExceptions = NetworkExceptionTypes.unauthorisedRequest;
                  break;
                case 403:
                  networkExceptions = NetworkExceptionTypes.notAcceptable;
                  break;
                case 404:
                  networkExceptions = NetworkExceptionTypes.notFound;
                  break;
                case 409:
                  networkExceptions = NetworkExceptionTypes.conflict;
                  break;
                case 408:
                  networkExceptions = NetworkExceptionTypes.requestTimeout;
                  break;
                case 500:
                  networkExceptions = NetworkExceptionTypes.internalServerError;
                  break;
                case 503:
                  networkExceptions = NetworkExceptionTypes.serviceUnavailable;
                  break;
                default:
                  networkExceptions = NetworkExceptionTypes.defaultError;
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = NetworkExceptionTypes.sendTimeout;
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptionTypes.noInternetConnection;
        } else {
          networkExceptions = NetworkExceptionTypes.unexpectedError;
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return NetworkExceptionTypes.formatException;
      } catch (_) {
        return NetworkExceptionTypes.unexpectedError;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptionTypes.unableToProcess;
      } else {
        return NetworkExceptionTypes.unexpectedError;
      }
    }
  }

  static String _getErrorMessage(NetworkExceptionTypes networkExceptions) {
    var errorMessage = "";
    switch (networkExceptions) {
      case NetworkExceptionTypes.requestCancelled:
        errorMessage = Strings.requestCancelled;
        break;
      case NetworkExceptionTypes.unauthorisedRequest:
        errorMessage = Strings.unauthorisedRequest;
        break;
      case NetworkExceptionTypes.badRequest:
        errorMessage = Strings.badRequest;
        break;
      case NetworkExceptionTypes.notFound:
        errorMessage = Strings.notFound;
        break;
      case NetworkExceptionTypes.methodIsNotAllowed:
        errorMessage = Strings.notAllowed;
        break;
      case NetworkExceptionTypes.notAcceptable:
        errorMessage = Strings.notAcceptable;
        break;
      case NetworkExceptionTypes.requestTimeout:
        errorMessage = Strings.requestTimeout;
        break;
      case NetworkExceptionTypes.sendTimeout:
        errorMessage = Strings.sendTimeout;
        break;
      case NetworkExceptionTypes.conflict:
        errorMessage = Strings.requestConflict;
        break;
      case NetworkExceptionTypes.internalServerError:
        errorMessage = Strings.internalServerError;
        break;
      case NetworkExceptionTypes.notImplemented:
        errorMessage = Strings.notImplemented;
        break;
      case NetworkExceptionTypes.serviceUnavailable:
        errorMessage = Strings.serviceUnavailable;
        break;
      case NetworkExceptionTypes.noInternetConnection:
        errorMessage = Strings.noInternetConnection;
        break;
      case NetworkExceptionTypes.formatException:
        errorMessage = Strings.formatException;
        break;
      case NetworkExceptionTypes.unableToProcess:
        errorMessage = Strings.unableToProcess;
        break;
      case NetworkExceptionTypes.defaultError:
        errorMessage = Strings.defaultError;
        break;
      case NetworkExceptionTypes.unexpectedError:
        errorMessage = Strings.unexpectedError;
        break;
    }
    return errorMessage;
  }
}
