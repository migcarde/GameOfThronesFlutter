import 'package:domain/base_usecase.dart';
import 'package:domain/categories/get_categories.dart';
import 'package:data/data_injection_container.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/widgets/categories/category_view_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _getCategories = locator<GetCategories>();

final categoriesFutureProvider =
    FutureProvider.autoDispose<BaseListState>((ref) async {
  final call = await _getCategories.call(NoParams());

  return call.fold(
      (l) => Error(message: 'Custom error'),
      (r) => Result<CategoryViewEntity>(
          result: r
              .map((business) => CategoryViewEntity.fromBusiness(business))
              .toList()));
});
