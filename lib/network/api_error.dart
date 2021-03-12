import 'package:dio/dio.dart';

/// description:
/// project:
/// @package: network
/// @author: dammyololade
/// created on: 3/11/21

class ApiError {
  int errorType = 0;
  ApiErrorModel apiErrorModel;
  String errorDescription;

  ApiError({this.errorDescription});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }

  void _handleError(Object error) {
    if (error is DioError) {
      DioError dioError = error; // as DioError;
      switch (dioError.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription =
              "Connection timeout with API server, please try again later";
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription =
              "Receive timeout in connection with API server, please try again later.";
          break;
        case DioErrorType.RESPONSE:
          this.errorType = dioError.response.statusCode;
          if (dioError.response.statusCode > 299 &&
              dioError.response.statusCode < 500) {
            //this.apiErrorModel = ApiErrorModel.fromJson(dioError.response.data);
            this.errorDescription =
                extractDescriptionFromResponse(error.response);
          } else {
            this.errorDescription =
                "Oops! we could'nt make connections, please try again";
          }
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription =
              "Connection to API server failed due to internet connection, please check and try again";
          break;
      }
    } else {
      errorDescription = "Oops an error occurred, we are fixing it";
    }
  }

  String extractDescriptionFromResponse(Response response) {
    String message = "";
    try {
      if (response?.data != null && response.data["message"] != null) {
        message = response.data["message"];
      } else {
        message = response.statusMessage;
      }
    } catch (error, stackTrace) {
      message = response?.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => '$errorDescription';
}

class ApiErrorModel {
  int code;
  ZError error;
  String message;
  bool success;

  ApiErrorModel({
    this.code,
    this.error,
    this.message,
    this.success,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        code: json["code"],
        //error: Error.fromJson(json["error"]),
        message: json["message"],
        success: json["success"],
      );
}

class ZError {
  String devMessage;
  String possibleSolution;
  String exceptionError;
  String userMessage;
  int errorCode;
  int statusCode;

  ZError({
    this.devMessage,
    this.possibleSolution,
    this.exceptionError,
    this.userMessage,
    this.errorCode,
    this.statusCode,
  });

  factory ZError.fromJson(Map<String, dynamic> json) => ZError(
        devMessage: json["devMessage"],
        possibleSolution: json["possibleSolution"],
        exceptionError: json["exceptionError"],
        userMessage: json["userMessage"],
        errorCode: json["errorCode"],
        statusCode: json["statusCode"],
      );
}
