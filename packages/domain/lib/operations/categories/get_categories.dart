import 'package:dartz/dartz.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/operations/categories/category_business.dart';
import 'package:domain/operations/categories/category_failure.dart';
import 'package:domain/operations/categories/category_repository.dart';

class GetCategories
    extends BaseUseCase<CategoryFailure, List<CategoryBusiness>, NoParams> {
  late final CategoryRepository categoryRepository;

  GetCategories({required this.categoryRepository});

  @override
  Future<Either<CategoryFailure, List<CategoryBusiness>>> call(
          NoParams params) =>
      categoryRepository.getCategories();
}
