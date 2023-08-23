import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shopping_application/core/constants/app_constants.dart';
import 'package:shopping_application/core/exceptions/generic_exception.dart';
import 'package:shopping_application/core/exceptions/server_exception.dart';

@injectable
class BaseService {
  Future<http.Response> getWS({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> params = const <String, dynamic>{},
  }) async {
    try {
      String url = '$baseUrl$uri';
      final Map<String, dynamic> globalParams = {};
      if (params.isNotEmpty) {
        globalParams.addAll(params);
      }
      final Uri tempUri = Uri.parse(url).replace(queryParameters: globalParams);
      final http.Response response =
          await http.get(tempUri, headers: headers).timeout(timeOutDuration);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw GenericException(
            statusCode: response.statusCode,
            message: 'Status code is different than success codes');
      }
    } on Exception {
      throw ServerException(info: 'Server Exception');
    }
  }
}
