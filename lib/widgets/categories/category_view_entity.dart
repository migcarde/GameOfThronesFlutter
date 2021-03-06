import 'package:domain/operations/categories/category_business.dart';

const BOOKS = 1;
const HOUSES = 2;
const CHARS = 3;

class CategoryViewEntity {
  late final String categoryName;
  late final int type;

  CategoryViewEntity({required this.categoryName, required this.type});

  factory CategoryViewEntity.fromBusiness(CategoryBusiness business) {
    final type = _getType(business.type);

    return CategoryViewEntity(categoryName: business.categoryName, type: type);
  }
}

int _getType(int businessType) {
  if (businessType == 0) {
    return BOOKS;
  } else if (businessType == 1) {
    return HOUSES;
  } else {
    return CHARS;
  }
}
