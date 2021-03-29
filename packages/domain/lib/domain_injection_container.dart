import 'package:domain/operations/books/get_books.dart';
import 'package:domain/operations/categories/get_categories.dart';
import 'package:domain/operations/categories/get_local_categories.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // Remote
  locator.registerFactory(() => GetCategories(categoryRepository: locator()));
  locator.registerFactory(() => GetBooks(bookRepository: locator()));

  // Local
  locator
      .registerFactory(() => GetLocalCategories(categoryRepository: locator()));
}
