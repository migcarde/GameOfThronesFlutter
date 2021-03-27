import 'package:data/categories/category_repository_impl.dart';
import 'package:data/categories/category_service.dart';
import 'package:domain/categories/category_repository.dart';
import 'package:domain/categories/get_categories.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(
      () => GetCategories(categoryRepository: locator()));

  locator.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(categoryService: locator()));

  locator.registerLazySingleton(() => CategoryService());
}
