import 'package:data/operations/categories/category_hive_model.dart';

class CategoryResponse {
  late final String categoryName;
  late final int type;

  CategoryResponse({required this.categoryName, required this.type});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(categoryName: json['category_name'], type: json['type']);
}

extension CategoryParser on List<CategoryResponse> {
  List<CategoryHiveModel> toHiveModel() => this
      .map((category) => CategoryHiveModel(
          categoryName: category.categoryName, type: category.type))
      .toList();
}
