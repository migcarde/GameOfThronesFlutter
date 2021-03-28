import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/operations/categories/category_repository_impl.dart';
import 'package:data/operations/categories/category_service.dart';
import 'package:domain/categories/category_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // Repository
  locator.registerLazySingleton<CategoryRepository>(() =>
      CategoryRepositoryImpl(
          categoryRemoteDataSource: locator(),
          categoryLocalDataSource: locator()));

  locator.registerLazySingleton(
      () => CategoryRemoteDataSource(categoryService: locator()));

  locator.registerLazySingleton(() => CategoryLocalDataSource(hive: locator()));

  locator.registerLazySingleton(() => CategoryService());
}
