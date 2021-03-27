import 'package:dartz/dartz.dart';
import 'package:data/failure.dart';
import 'package:domain/categories/category_business.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryBusiness>>> getCategories();
}
