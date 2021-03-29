import 'package:data/repository_failure.dart';
import 'package:domain/operations/categories/category_error.dart';

abstract class CategoryFailure {
  CategoryFailure([List properties = const <dynamic>[]]) : super();
}

class CategoryKnowError extends CategoryError {}

class CategoryRepositoryFailure extends CategoryFailure {
  late final RepositoryFailure failure;

  CategoryRepositoryFailure({required this.failure}) : super([failure]);
}
