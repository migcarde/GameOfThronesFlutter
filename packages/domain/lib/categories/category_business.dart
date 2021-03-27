import 'package:data/categories/category_hive_model.dart';
import 'package:data/categories/category_model.dart';

class CategoryBusiness {
  late final String categoryName;
  late final int type;

  CategoryBusiness({required this.categoryName, required this.type});

  factory CategoryBusiness.fromModel(CategoryModel model) =>
      CategoryBusiness(categoryName: model.categoryName, type: model.type);

  factory CategoryBusiness.fromHiveModelAdapter(CategoryHiveModel model) =>
      CategoryBusiness(categoryName: model.categoryName, type: model.type);
}
