import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_error_type.dart';
import 'api_result_type.dart';

class ApiResponse {
  final ApiErrorType errorCode;
  final dynamic data;
  final DioError error;
  final Headers headers;

  Map<String, dynamic> _json;
  List<Map<String, dynamic>> _jsonArray;
  ApiResultType _result;

  ApiResponse({this.data, this.error, this.errorCode, this.headers}) {
    _json = data is Map ? Map<String, dynamic>.from(data) : null;
    _jsonArray = data is List ? List<Map<String, dynamic>>.from(data) : [];
    _result = error != null ||
            (_json != null &&
                (_json.containsKey('error') || _json.containsKey('errors')))
        ? ApiResultType.error
        : ApiResultType.success;
  }

  bool get succeed => _result == ApiResultType.success;

  bool get isJsonData => data is Map;

  ApiResultType get result => _result;

  Map<String, dynamic> get json => _json;

  List<Map<String, dynamic>> get jsonArray => _jsonArray;

  String get dioErrorMessage =>
      error?.message?.toString() ?? "Une erreur est survenue";

  String getFullErrorTrace() => error?.response?.toString() ?? "";

  Map<String, dynamic> get errorResponseJson =>
      error != null && error.response != null
          ? (error.response.data is String
              ? jsonDecode(error.response.data)
              : error.response.data)
          : null;

  String get errorMessage {
    Map<String, dynamic> errorJson = this.errorResponseJson;
    if (errorJson != null && errorJson.containsKey('message')) {
      List<dynamic> errors = (errorJson['message'] as Map).values.toList();

      if (errors.length > 0) {
        if (errors.first is List) {
          return errors.first.first.toString();
        }
      }
    }

    return null;
  }

  bool hasErrorField(String field) {
    Map<String, dynamic> errorJson = this.errorResponseJson;
    if (errorJson != null && errorJson.containsKey('errors')) {
      return (errorJson['errors'] as Map).containsKey(field);
    }

    return false;
  }

  String get responseCode =>
      _json != null && _json.containsKey('code') ? _json['code'] : null;
}
