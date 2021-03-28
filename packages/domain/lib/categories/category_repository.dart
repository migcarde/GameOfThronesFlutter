import 'package:dartz/dartz.dart';
import 'package:domain/categories/category_business.dart';
import 'package:domain/categories/category_failure.dart';

abstract class CategoryRepository {
  Future<Either<CategoryFailure, List<CategoryBusiness>>> getCategories();
  Future<Either<CategoryFailure, List<CategoryBusiness>>> getLocalCategories();
}
