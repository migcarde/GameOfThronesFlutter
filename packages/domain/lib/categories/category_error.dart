import 'package:domain/categories/category_failure.dart';

abstract class CategoryError extends CategoryFailure {
  CategoryError([List properties = const <dynamic>[]]) : super();
}

class GetCategoriesError extends CategoryError {}
