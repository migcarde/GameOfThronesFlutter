import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/common/dimens.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/books/book_list_screen.dart';
import 'package:game_of_thrones/widgets/categories/category_item.dart';
import 'package:game_of_thrones/widgets/categories/category_list_providers.dart';
import 'package:game_of_thrones/widgets/categories/category_view_entity.dart';
import 'package:game_of_thrones/widgets/chars/char_list_screen.dart';
import 'package:game_of_thrones/widgets/houses/house_list_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categories = watch(categoriesFutureProvider);

    return SafeArea(
      child: categories.when(
          data: (state) => _manageState(state),
          loading: () => Center(
                child: CircularProgressIndicator(),
              ),
          error: (_, __) =>
              Text('Ha ocurrido un error, por favor, inténtelo más tarde')),
    );
  }

  Widget _manageState(BaseListState state) {
    if (state is Result) {
      return ListView.builder(
          itemCount: state.result.length,
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: mediumDimen),
              child: CategoryItem(
                  category: state.result[index],
                  onClick: (type) =>
                      Navigator.push(context, _selectPage(type)))));
    } else if (state is Empty) {
      return Center(
        child: Text(
          'La lista esta vacía',
          style: TextStyles.boldText(),
        ),
      );
    } else {
      final error = state as Error;
      return Center(child: Text(error.message));
    }
  }

  MaterialPageRoute _selectPage(int type) {
    final MaterialPageRoute result;

    if (type == BOOKS) {
      result =
          MaterialPageRoute(builder: (context) => BookListScreen(type: type));
    } else if (type == HOUSES) {
      result =
          MaterialPageRoute(builder: (context) => HouseListScreen(type: type));
    } else {
      result =
          MaterialPageRoute(builder: (context) => CharListScreen(type: type));
    }

    return result;
  }
}
