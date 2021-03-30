import 'dart:io';

import 'package:common_flutter/app_config.dart';
import 'package:data/network_request.dart' as httpInterceptor;
import 'package:data/operations/remote/response_parse.dart';
import 'package:data/repository_failure.dart';

class CharService {
  Future<List<dynamic>> getChars(int type) async {
    try {
      final response = await httpInterceptor
          .get(Uri.https(AppConfig.instance.baseUrl, 'list/$type'));

      final body = parsedResponse(response);

      return body;
    } on SocketException {
      throw NoInternet;
    } on HttpException {
      throw RepositoryException;
    } on FormatException {
      throw RepositoryException;
    } catch (e) {
      throw Unknown();
    }
  }
}
