import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_thrones/base/base_list_state.dart';
import 'package:game_of_thrones/common/dimens.dart';
import 'package:game_of_thrones/common/text_styles.dart';
import 'package:game_of_thrones/widgets/books/book_list_screen.dart';
import 'package:game_of_thrones/widgets/categories/category_item.dart';
import 'package:game_of_thrones/widgets/categories/category_list_providers.dart';
import 'package:game_of_thrones/widgets/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categories = watch(categoriesFutureProvider);

    return SafeArea(
      child: categories.when(
          data: (state) => _manageState(state),
          loading: () => SplashScreen(),
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
                onClick: (type) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookListScreen(type: type))),
              )));
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
}
