import 'package:data/operations/books/book_remote_data_source.dart';
import 'package:data/operations/books/book_repository_impl.dart';
import 'package:data/operations/books/book_service.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/operations/categories/category_repository_impl.dart';
import 'package:data/operations/categories/category_service.dart';
import 'package:domain/operations/books/book_repository.dart';
import 'package:domain/operations/categories/category_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // Repository
  locator.registerLazySingleton<CategoryRepository>(() =>
      CategoryRepositoryImpl(
          categoryRemoteDataSource: locator(),
          categoryLocalDataSource: locator()));
  locator.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
      bookRemoteDataSource: locator(), networkManager: locator()));

  // Remote data source
  locator.registerLazySingleton(
      () => CategoryRemoteDataSource(categoryService: locator()));
  locator.registerLazySingleton(
      () => BookRemoteDataSource(bookService: locator()));

  // Local data source
  locator.registerLazySingleton(() => CategoryLocalDataSource(hive: locator()));

  // Service
  locator.registerLazySingleton(() => CategoryService());
  locator.registerSingleton(() => BookService());
}
