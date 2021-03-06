import 'package:dartz/dartz.dart';
import 'package:data/network_manager.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/categories/category_business.dart';
import 'package:domain/operations/categories/category_failure.dart';
import 'package:domain/operations/categories/category_repository.dart';
import 'package:data/operations/categories/category_response.dart';
import 'package:data/operations/categories/category_hive_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  late final CategoryRemoteDataSource categoryRemoteDataSource;
  late final CategoryLocalDataSource categoryLocalDataSource;
  late final NetworkManager networkManager;

  CategoryRepositoryImpl(
      {required this.categoryRemoteDataSource,
      required this.categoryLocalDataSource,
      required this.networkManager});

  @override
  Future<Either<CategoryFailure, List<CategoryBusiness>>>
      getCategories() async {
    try {
      if (await networkManager.hasInternetConnection) {
        final categories = await categoryRemoteDataSource.getCategories();
        categoryLocalDataSource.saveCategories(categories);

        final result =
            categories.map((response) => response.toDomain()).toList();

        return Right(result);
      } else {
        throw NoInternet();
      }
    } on RepositoryFailure catch (failure) {
      return Left(CategoryRepositoryFailure(failure: failure));
    } on GetCategoriesError {
      return Left(GetCategoriesError());
    }
  }

  @override
  Future<Either<CategoryFailure, List<CategoryBusiness>>>
      getLocalCategories() async {
    try {
      final categories = await categoryLocalDataSource.getCategories();

      final result = categories.map((model) => model.toDomain()).toList();

      return Right(result);
    } catch (e) {
      return Left(CategoryRepositoryFailure(failure: Unknown()));
    }
  }
}
