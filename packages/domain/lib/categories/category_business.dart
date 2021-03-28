import 'package:data/operations/categories/category_hive_model.dart';
import 'package:data/operations/categories/category_response.dart';

class CategoryBusiness {
  late final String categoryName;
  late final int type;

  CategoryBusiness({required this.categoryName, required this.type});

  factory CategoryBusiness.fromResponse(CategoryResponse model) =>
      CategoryBusiness(categoryName: model.categoryName, type: model.type);

  factory CategoryBusiness.fromHiveModel(CategoryHiveModel model) =>
      CategoryBusiness(categoryName: model.categoryName, type: model.type);
}
