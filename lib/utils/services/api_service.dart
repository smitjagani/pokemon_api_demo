import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smit_jagani_flutter_task/config/api_constant.dart';

class ApiClient {
  /// The base URL for the API
  static const String baseUrl = ApiConstant.baseUrl;

  get header => {};

  Future<Map<String, dynamic>> getData({String? url, bool isBaseUrlUse = true}) async {
    /// Fetch data from the API
    try {
      final response = await http.get(
        Uri.parse("${isBaseUrlUse ? baseUrl : ""}${url!}"),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<Map<String, dynamic>> postData({Map<String, dynamic>? body, String? url}) async {
    /// Post data to the API
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url!),
        headers: header,
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Error posting data: $e');
    }
  }

  Future<Map<String, dynamic>> putData({Map<String, dynamic>? body, String? url}) async {
    /// Put data to the API
    try {
      final response = await http.put(
        Uri.parse(baseUrl + url!),
        headers: header,
        body: body,
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Error putting data: $e');
    }
  }

  Future<Map<String, dynamic>> deleteData({String? id, String? url}) async {
    /// Delete data from the API
    try {
      final response = await http.delete(
        Uri.parse("$baseUrl${url!}/${id!}"),
        headers: header,
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Error deleting data: $e');
    }
  }

  Future<Map<String, dynamic>> formDataRequest(
      {Map<String, dynamic>? formData, String? url}) async {
    /// Send form data to the API
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/upload'),
        body: formData,
        headers: {'Content-Type': 'multipart/form-data'},
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Error uploading data: $e');
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    /// Handle the response from the API
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode == 200 || statusCode == 201) {
      /// Return the decoded JSON response
      return json.decode(body);
    } else if (statusCode == 400) {
      throw BadRequestException(message: 'Bad request');
    } else if (statusCode == 401) {
      throw UnauthorizedException(message: 'Unauthorized');
    } else if (statusCode == 403) {
      throw ForbiddenException(message: 'Forbidden');
    } else if (statusCode == 404) {
      throw NotFoundException(message: 'Not found');
    } else if (statusCode == 500) {
      throw InternalServerErrorException(message: 'Internal server error');
    } else {
      throw Exception('Failed with status code: $statusCode');
    }
  }
}

// Custom exceptions for different HTTP status codes
class BadRequestException implements Exception {
  /// Custom exception for 400 status code
  final String message;

  BadRequestException({required this.message});
}

class UnauthorizedException implements Exception {
  /// Custom exception for 401 status code
  final String message;

  UnauthorizedException({required this.message});
}

class ForbiddenException implements Exception {
  /// Custom exception for 403 status code
  final String message;

  ForbiddenException({required this.message});
}

class NotFoundException implements Exception {
  /// Custom exception for 404 status code
  final String message;

  NotFoundException({required this.message});
}

class InternalServerErrorException implements Exception {
  /// Custom exception for 500 status code
  final String message;

  InternalServerErrorException({required this.message});
}
