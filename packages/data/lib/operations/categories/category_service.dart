import 'dart:convert';
import 'dart:io';

import 'package:common_flutter/app_config.dart';
import 'package:data/failure.dart';
import 'package:data/network_request.dart' as httpInterceptor;

class CategoryService {
  Future<List<dynamic>> getCategories() async {
    try {
      final response = await httpInterceptor
          .get(Uri.https(AppConfig.instance.baseUrl, '/categories'));

      final body = jsonDecode(response.body) as List;

      return body;
    } on SocketException {
      throw NoInternet;
    } on HttpException {
      throw RepositoryException;
    } on FormatException {
      throw RepositoryException;
    } catch (e) {
      throw Unknown(message: 'Cannot load categories, please, try it later.');
    }
  }
}
