import 'package:data/operations/categories/category_response.dart';
import 'package:data/operations/categories/category_service.dart';

class CategoryRemoteDataSource {
  late final CategoryService categoryService;

  CategoryRemoteDataSource({required this.categoryService});

  Future<List<CategoryResponse>> getCategories() async {
    final response = await categoryService.getCategories();

    return response.map((json) => CategoryResponse.fromJson(json)).toList();
  }
}
