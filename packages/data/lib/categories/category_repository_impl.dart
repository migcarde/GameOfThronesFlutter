import 'package:common_flutter/network_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:data/categories/category_hive_model.dart';
import 'package:data/categories/category_model.dart';
import 'package:data/categories/category_service.dart';
import 'package:data/failure.dart';
import 'package:domain/categories/category_business.dart';
import 'package:domain/categories/category_repository.dart';
import 'package:hive/hive.dart';

const CATEGORIES_BOX = "categoriesBox";

class CategoryRepositoryImpl extends CategoryRepository {
  late final CategoryService categoryService;

  CategoryRepositoryImpl({required this.categoryService});

  @override
  Future<Either<Failure, List<CategoryBusiness>>> getCategories() async {
    try {
      final aux = await _getHiveCategories();
      if (await NetworkManager().hasInternetConnection()) {
        final categories = await categoryService.getCategories();

        final result = categories
            .map((model) => CategoryBusiness.fromModel(model))
            .toList();

        _saveHive(categories);

        return Right(result);
      } else {
        throw NoInternet();
      }
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      throw e;
    }
  }

  void _saveHive(List<CategoryModel> categories) async {
    final categoriesBox = await Hive.openBox(CATEGORIES_BOX);
    final categoriesHiveModels = categories.toHiveModel();

    categoriesBox.addAll(categoriesHiveModels);
  }

  Future<List<CategoryBusiness>> _getHiveCategories() async {
    final categoriesBox = await Hive.openBox(CATEGORIES_BOX);
    final raw = categoriesBox.toMap();
    final aux = raw.values.toList().cast<CategoryHiveModel>();

    return aux.map((e) => CategoryBusiness.fromHiveModelAdapter(e)).toList();
  }
}
