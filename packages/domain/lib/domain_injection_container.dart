import 'package:domain/categories/get_categories.dart';
import 'package:domain/categories/get_local_categories.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => GetCategories(categoryRepository: locator()));
  locator
      .registerFactory(() => GetLocalCategories(categoryRepository: locator()));
}
