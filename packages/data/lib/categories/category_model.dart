import 'package:data/categories/category_hive_model.dart';

class CategoryModel {
  late final String categoryName;
  late final int type;

  CategoryModel({required this.categoryName, required this.type});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(categoryName: json['category_name'], type: json['type']);
}

extension CategoryParsion on List<CategoryModel> {
  List<CategoryHiveModel> toHiveModel() => this
      .map((category) => CategoryHiveModel(
          categoryName: category.categoryName, type: category.type))
      .toList();
}
