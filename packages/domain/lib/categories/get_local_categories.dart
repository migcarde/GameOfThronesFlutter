import 'package:dartz/dartz.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/categories/category_business.dart';
import 'package:domain/categories/category_failure.dart';
import 'package:domain/categories/category_repository.dart';

class GetLocalCategories
    extends BaseUseCase<CategoryFailure, List<CategoryBusiness>, NoParams> {
  final CategoryRepository categoryRepository;

  GetLocalCategories({required this.categoryRepository});

  @override
  Future<Either<CategoryFailure, List<CategoryBusiness>>> call(
          NoParams params) =>
      categoryRepository.getLocalCategories();
}
