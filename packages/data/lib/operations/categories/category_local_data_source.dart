import 'package:data/operations/categories/category_hive_model.dart';
import 'package:data/operations/categories/category_response.dart';
import 'package:hive/hive.dart';

const CATEGORIES_BOX = "categoriesBox";

class CategoryLocalDataSource {
  void saveCategories(List<CategoryResponse> categories) async {
    final categoriesBox = await Hive.openBox(CATEGORIES_BOX);
    final categoriesHiveModels = categories.toHiveModel();

    categoriesBox.addAll(categoriesHiveModels);
  }

  Future<List<CategoryHiveModel>> getCategories() async {
    final categoriesBox = await Hive.openBox(CATEGORIES_BOX);
    final categories =
        categoriesBox.toMap().values.toList().cast<CategoryHiveModel>();

    return categories;
  }
}
