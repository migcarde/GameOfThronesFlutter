import 'package:domain/base_usecase.dart';
import 'package:domain/categories/get_categories.dart';
import 'package:game_of_thrones/category_view_entity.dart';
import 'package:game_of_thrones/injection_container.dart';
import 'package:game_of_thrones/main_screen_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _getCategories = locator<GetCategories>();

final categoriesFuture = FutureProvider.autoDispose<BaseListState>((ref) async {
  final call = await _getCategories.call(NoParams());

  return call.fold(
      (l) => Error(message: 'Custom error'),
      (r) => Result<CategoryViewEntity>(
          result: r.map((e) => CategoryViewEntity.fromBusiness(e)).toList()));
});
