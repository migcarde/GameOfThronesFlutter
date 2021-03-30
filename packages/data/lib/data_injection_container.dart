import 'package:connectivity/connectivity.dart';
import 'package:data/network_manager.dart';
import 'package:data/operations/books/book_remote_data_source.dart';
import 'package:data/operations/books/book_repository_impl.dart';
import 'package:data/operations/books/book_service.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/operations/categories/category_repository_impl.dart';
import 'package:data/operations/categories/category_service.dart';
import 'package:data/operations/houses/house_remote_data_source.dart';
import 'package:data/operations/houses/house_repository_impl.dart';
import 'package:data/operations/houses/house_service.dart';
import 'package:domain/operations/books/book_repository.dart';
import 'package:domain/operations/categories/category_repository.dart';
import 'package:domain/operations/houses/house_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final locator = GetIt.instance;

void init() {
  // Repository
  locator.registerLazySingleton<CategoryRepository>(() =>
      CategoryRepositoryImpl(
          categoryRemoteDataSource: locator(),
          categoryLocalDataSource: locator(),
          networkManager: locator()));
  locator.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
      bookRemoteDataSource: locator(), networkManager: locator()));
  locator.registerLazySingleton<HouseRepository>(() => HouseRepositoryImpl(
      houseRemoteDataSource: locator(), networkManager: locator()));

  // Remote data source
  locator.registerLazySingleton(
      () => CategoryRemoteDataSource(categoryService: locator()));
  locator.registerLazySingleton(
      () => BookRemoteDataSource(bookService: locator()));
  locator.registerLazySingleton(
      () => HouseRemoteDataSource(houseService: locator()));

  // Local data source
  locator.registerLazySingleton(() => CategoryLocalDataSource(hive: locator()));

  // Service
  locator.registerLazySingleton(() => CategoryService());
  locator.registerLazySingleton(() => BookService());
  locator.registerLazySingleton(() => HouseService());

  // Others
  locator.registerLazySingleton(() => Hive);
  locator.registerLazySingleton(() => NetworkManager(connectivity: locator()));
  locator.registerLazySingleton(() => Connectivity());
}
