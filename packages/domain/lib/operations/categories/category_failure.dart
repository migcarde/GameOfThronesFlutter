import 'package:data/repository_failure.dart';

abstract class CategoryFailure {
  CategoryFailure([List properties = const <dynamic>[]]) : super();
}

// This class is used for specific errors from the service
class GetCategoriesError extends CategoryFailure {}

class CategoryRepositoryFailure extends CategoryFailure {
  late final RepositoryFailure failure;

  CategoryRepositoryFailure({required this.failure}) : super([failure]);
}
