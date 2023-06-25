import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:elisoft_techincal_assignment/core/helpers/common_variables.dart';

class Methods {
  Dio dio = Dio();

  handleError(error) {
    String errorDesc = '';
    DioException? dioException;

    if (error is DioException) {
      dioException = error;

      switch(dioException.type) {
        case DioExceptionType.cancel:
          errorDesc = 'Request to the server was cancelled';
          break;
        case DioExceptionType.connectionTimeout:
          errorDesc = 'Connection timeout with the server';
          break;
        case DioExceptionType.connectionError:
          errorDesc = 'Encountered an error in connection with the server';
          break;
        case DioExceptionType.sendTimeout:
          errorDesc = 'Send timeout with the server';
          break;
        case DioExceptionType.receiveTimeout:
          errorDesc = 'Receive timeout with the server';
          break;
        case DioExceptionType.badCertificate:
          errorDesc = 'Bad Certificate';
          break;
        case DioExceptionType.badResponse:
          errorDesc = 'Server returned a bad response';
          break;
        case DioExceptionType.unknown:
          errorDesc = 'Unknown error occurred';
          break;
      }
    } else {
      errorDesc = 'Unexpected error occurred';
    }

    print('Status Code: ${dioException!.response!.statusCode}, Message: $errorDesc');
    return dioException.response!.data;
  }

  Future dioLogin(url, data) async {
    try {
      final response = await dio.post(
        baseApiUrl + url,
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Bearer-Token': bearerToken
          }
        )
      );

      return response.data;
    } catch(err) {
      handleError(err);
    }
  }

  Future dioGet(url) async {
    try {
      final response = await dio.get(
        baseApiUrl + url,
        options: Options(
          headers: {
            'Bearer-Token': bearerToken
          }
        )
      );

      return response.data;
    } catch(err) {
      handleError(err);
    }
  }
}

class Auth extends Methods {
  Future login(data) async {
    return await dioLogin('/auth/login', data);
  }
}

class Articles extends Methods {
  Future getArticles() async {
    return await dioGet('/articles');
  }
}