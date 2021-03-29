import 'package:dartz/dartz.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/operations/categories/category_business.dart';
import 'package:domain/operations/categories/category_error.dart';
import 'package:domain/operations/categories/category_failure.dart';
import 'package:domain/operations/categories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  late final CategoryRemoteDataSource categoryRemoteDataSource;
  late final CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepositoryImpl(
      {required this.categoryRemoteDataSource,
      required this.categoryLocalDataSource});

  @override
  Future<Either<CategoryFailure, List<CategoryBusiness>>>
      getCategories() async {
    try {
      if (await NetworkManager().hasInternetConnection()) {
        final categories = await categoryRemoteDataSource.getCategories();
        categoryLocalDataSource.saveCategories(categories);

        final result = categories
            .map((response) => CategoryBusiness.fromResponse(response))
            .toList();

        return Right(result);
      } else {
        throw NoInternet();
      }
    } on RepositoryFailure catch (failure) {
      return Left(CategoryRepositoryFailure(failure: failure));
    } on CategoryError {
      return Left(GetCategoriesError());
    }
  }

  @override
  Future<Either<CategoryFailure, List<CategoryBusiness>>>
      getLocalCategories() async {
    try {
      final categories = await categoryLocalDataSource.getCategories();

      final result = categories
          .map((model) => CategoryBusiness.fromHiveModel(model))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(CategoryRepositoryFailure(failure: Unknown()));
    }
  }
}
