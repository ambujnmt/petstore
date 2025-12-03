import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/app_imports.dart';
import 'api_headers.dart.dart';

class ApiServices {
  static const baseUrl = 'blanchedalmond-capybara-827173.hostingersite.com';

  static Future<dynamic> post(
    dynamic endPoint, {
    Map<String, dynamic>? payload,
    Map<String, String>? customHeaders,
    Function(http.Response response)? onError,
  }) async {
    try {
      if (endPoint is String) {
        endPoint = setUri(endPoint);
      }
      final res = await http.post(
        endPoint,
        headers: customHeaders ?? ApiHeaders.authHeaders(),
        body: jsonEncode(payload),
      );
      return handleResponse(res, 'post', endPoint.toString(), onError: onError);
    } catch (e) {
      debugPrint('Error api calling: ${e.toString()}');
      return null;
    }
  }

  static Future<dynamic> get(
    dynamic endPoint, {
    Map<String, String>? queries,
    Map<String, String>? customHeaders,
    Function(http.Response response)? onError,
  }) async {
    try {
      if (endPoint is String) {
        endPoint = setUri(endPoint, queries: queries);
      }
      final res = await http.get(
        endPoint,
        headers: customHeaders ?? ApiHeaders.authHeaders(),
      );
      return handleResponse(res, 'get', endPoint.toString(), onError: onError);
    } catch (e) {
      debugPrint('Error api calling: ${e.toString()}');
      return null;
    }
  }

  static Future<dynamic> multipartPost(
    dynamic endPoint, {
    Map<String, String?>? fields,
    Map<String, String>? customHeaders,
    Map<String, File>? files,
    Function(http.Response response)? onError,
  }) async {
    try {
      if (endPoint is String) {
        endPoint = setUri(endPoint);
      }

      final request = http.MultipartRequest('POST', endPoint);

      request.headers.addAll(customHeaders ?? ApiHeaders.authHeaders());
      if (fields != null) {
        fields.removeWhere((key, value) => value == null);
        request.fields.addAll(fields.map((k, v) => MapEntry(k, v.toString())));
      }

      if (files != null) {
        for (final entry in files.entries) {
          final file = await http.MultipartFile.fromPath(
            entry.key,
            entry.value.path,
          );
          request.files.add(file);
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return handleResponse(
        response,
        'multipartPost',
        endPoint.toString(),
        onError: onError,
      );
    } catch (e) {
      debugPrint('Error in multipart API call: ${e.toString()}');
      return null;
    }
  }

  static setUri(String endPoint, {Map<String, String>? queries}) {
    return Uri.https(baseUrl, 'wp-json/pinkpaws/v1$endPoint', queries);
  }

  static handleResponse(
    http.Response response,
    String method,
    String api, {
    Function(http.Response response)? onError,
  }) {
    final code = response.statusCode;
    debugPrint('api: ${method.toUpperCase()} $api');
    debugPrint('code: $code');
    debugPrint('body: ${response.body}');

    switch (code) {
      case 200 || 201:
        return jsonDecode(response.body);
      case 204:
        return '';
      default:
        if (onError != null) {
          onError(response);
        } else {
          printErrorMessage(response);
        }
    }
    return null;
  }

  static void printErrorMessage(http.Response response) {
    try {
      final json = jsonDecode(response.body);
      var errorMessage = 'Something went wrong.';
      if (json.containsKey('message')) {
        errorMessage = json['message'];
      } else {
        errorMessage =
            (json['errors'] as Map<String, dynamic>).values.first[0] as String;
      }
      AppToast.error(errorMessage);
    } catch (e) {
      AppToast.error('Something went wrong.');
    }
  }
}
