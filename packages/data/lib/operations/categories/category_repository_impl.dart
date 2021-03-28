import 'package:common_flutter/network_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:data/failure.dart';
import 'package:data/operations/categories/category_local_data_source.dart';
import 'package:data/operations/categories/category_remote_data_source.dart';
import 'package:domain/categories/category_business.dart';
import 'package:domain/categories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  late final CategoryRemoteDataSource categoryRemoteDataSource;
  late final CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepositoryImpl(
      {required this.categoryRemoteDataSource,
      required this.categoryLocalDataSource});

  @override
  Future<Either<Failure, List<CategoryBusiness>>> getCategories() async {
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
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<CategoryBusiness>>> getLocalCategories() async {
    try {
      final categories = await categoryLocalDataSource.getCategories();

      final result = categories
          .map((model) => CategoryBusiness.fromHiveModel(model))
          .toList();

      return Right(result);
    } catch (e) {
      return Left(Unknown(message: 'Something is wrong'));
    }
  }
}
