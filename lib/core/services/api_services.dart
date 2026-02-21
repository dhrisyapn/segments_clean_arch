import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:segments_clean_arch/core/services/network_service.dart';
import 'package:segments_clean_arch/core/utils/exceptions.dart';

class ApiServices {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.elearning.alpha.logidots.com/api',
      headers: {'Accept': 'application/json', 'X-App-Type': 'learner'},
      validateStatus: (status) {
        return status != null && (status == 200 || status == 201);
      },
    ),
  );

  static Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _handleRequest(
      () => _dio.get(endpoint, queryParameters: queryParameters),
    );
  }

  static Future<dynamic> post(String endpoint, {dynamic body}) async {
    return _handleRequest(() => _dio.post(endpoint, data: body));
  }

  static Future<dynamic> put(String endpoint, {dynamic body}) async {
    return _handleRequest(() => _dio.put(endpoint, data: body));
  }

  static Future<dynamic> patch(String endpoint, {dynamic body}) async {
    return _handleRequest(() => _dio.patch(endpoint, data: body));
  }

  static Future<dynamic> delete(String endpoint, {dynamic body}) async {
    return _handleRequest(() => _dio.delete(endpoint, data: body));
  }

  static Future<dynamic> _handleRequest(
    Future<Response> Function() request,
  ) async {
    final hasInternet = await NetworkService().hasInternetConnection;
    if (!hasInternet) {
      throw const NoInternetException();
    }

    try {
      final response = await request();
      log(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? e.message ?? 'Unknown DioError');
      if (e.response != null) {
        throw e.response?.data['error'] ?? e.response?.data['message'];
      } else {
        throw 'Something went wrong.';
      }
    } catch (e) {
      log(e.toString());

      throw e.toString();
    }
  }
}

  // static void _showError(dynamic data) {
  //   if (data is Map<String, dynamic> &&
  //       (data.containsKey('error') || data.containsKey('message'))) {
  //     final message = data['error'] ?? data['message'];
  //     if (message is List) {
  //       if (message.isNotEmpty) {}
  //     } else {}
  //   } else {}
  // }

//}

/*
Usage Examples:

// GET Request
final data = await ApiServices.get('/users', queryParameters: {'page': 1});

// POST Request with body
final response = await ApiServices.post('/login', body: {'email': 'test@test.com', 'password': '123'});

// POST Request without body
final response = await ApiServices.post('/logout');

// PUT Request with body
final response = await ApiServices.put('/users/1', body: {'name': 'New Name'});

// PUT Request without body
final response = await ApiServices.put('/users/1/activate');

// PATCH Request with body
final response = await ApiServices.patch('/users/1', body: {'active': true});

// DELETE Request
final response = await ApiServices.delete('/users/1');

// DELETE Request with body
final response = await ApiServices.delete('/users/delete-batch', body: {'ids': [1, 2, 3]});
*/
