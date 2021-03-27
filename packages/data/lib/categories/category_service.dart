import 'dart:convert';
import 'dart:io';

import 'package:common_flutter/app_config.dart';
import 'package:data/categories/category_model.dart';
import 'package:data/failure.dart';
import 'package:data/network_request.dart' as httpInterceptor;

class CategoryService {
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await httpInterceptor
          .get(Uri.https(AppConfig.instance.baseUrl, '/categories'));

      final body = jsonDecode(response.body) as List;

      return body.map((json) => CategoryModel.fromJson(json)).toList();
    } on SocketException {
      throw NoInternet;
    } on HttpException {
      throw RepositoryException;
    } on FormatException catch (e) {
      throw RepositoryException;
    } catch (e) {
      throw Unknown(message: 'Cannot load categories, please, try it later.');
    }
  }
}
