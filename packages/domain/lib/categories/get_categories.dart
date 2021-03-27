import 'package:data/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/base_usecase.dart';
import 'package:domain/categories/category_business.dart';
import 'package:domain/categories/category_repository.dart';

class GetCategories extends BaseUseCase<List<CategoryBusiness>, NoParams> {
  late final CategoryRepository categoryRepository;

  GetCategories({required this.categoryRepository});

  @override
  Future<Either<Failure, List<CategoryBusiness>>> call(NoParams params) =>
      categoryRepository.getCategories();
}
