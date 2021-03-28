import 'package:data/data_injection_container.dart';
import 'package:data/repository_failure.dart';
import 'package:domain/base/base_usecase.dart';
import 'package:domain/categories/category_business.dart';
import 'package:domain/categories/category_failure.dart';
import 'package:domain/categories/get_categories.dart';
import 'package:domain/categories/get_local_categories.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/widgets/categories/category_view_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _getCategories = locator<GetCategories>();
final _getLocalCategories = locator<GetLocalCategories>();

final categoriesFutureProvider =
    FutureProvider.autoDispose<BaseListState>((ref) async {
  final call = await _getLocalCategories.call(NoParams());

  return call.fold(
      (l) => _handleCategoryError(l), (r) => _handleLocalCategoriesSuccess(r));
});

Future<BaseListState> _handleLocalCategoriesSuccess(
    List<CategoryBusiness> categories) async {
  if (categories.isEmpty) {
    final call = await _getCategories.call(NoParams());

    return call.fold(
        (l) => _handleCategoryError(l),
        (r) => Result<CategoryViewEntity>(
            result: r
                .map((business) => CategoryViewEntity.fromBusiness(business))
                .toList()));
  } else {
    return Result<CategoryViewEntity>(
        result: categories
            .map((business) => CategoryViewEntity.fromBusiness(business))
            .toList());
  }
}

Error _handleCategoryError(CategoryFailure failure) {
  if (failure is CategoryRepositoryFailure) {
    return _handleRepositoryFailure(failure);
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}

Error _handleRepositoryFailure(
    CategoryRepositoryFailure categoryRepositoryFailure) {
  if (categoryRepositoryFailure.failure is NoInternet) {
    return Error(message: 'No internet');
  } else {
    return Error(
        message: 'Ha ocurrido un error, por favor, inténtelo más tarde');
  }
}
