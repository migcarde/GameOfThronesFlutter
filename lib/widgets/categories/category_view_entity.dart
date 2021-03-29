import 'package:domain/operations/categories/category_business.dart';

class CategoryViewEntity {
  late final String categoryName;
  late final int type;

  CategoryViewEntity({required this.categoryName, required this.type});

  factory CategoryViewEntity.fromBusiness(CategoryBusiness business) =>
      CategoryViewEntity(
          categoryName: business.categoryName, type: business.type);
}
