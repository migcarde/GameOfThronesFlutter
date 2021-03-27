import 'package:hive/hive.dart';

part 'category_hive_model.g.dart';

@HiveType(typeId: 0)
class CategoryHiveModel {
  @HiveField(0)
  late final int type;

  @HiveField(1)
  late final String categoryName;

  CategoryHiveModel({required this.type, required this.categoryName});
}
